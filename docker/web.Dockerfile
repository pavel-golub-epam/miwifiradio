FROM richarvey/nginx-php-fpm
ARG MIR_WWW_PATH
ARG MIR_DOMAIN_NAME
ARG MIR_SSL_ENABLED
ENV MIR_WWW_PATH=$MIR_WWW_PATH
RUN apk update
RUN apk add ffmpeg
RUN mkdir -p $MIR_WWW_PATH
WORKDIR $MIR_WWW_PATH
ADD ./ ./
RUN mkdir -p uploads/playing
RUN chmod a+w uploads
RUN chmod a+w uploads/playing
RUN chmod a+w config/config.php
RUN envsubst '$MIR_DOMAIN_NAME$MIR_WWW_PATH' < docker/nginx.config > /etc/nginx/sites-enabled/default.conf
RUN if [ "$MIR_SSL_ENABLED" = "1" ] ; then envsubst '$MIR_DOMAIN_NAME$MIR_WWW_PATH' < docker/nginx.ssl.config > /etc/nginx/sites-enabled/default.ssl.conf ; fi;
RUN sed -i 's/libfdk_aac/aac/g' include/ffcontrol.php
RUN crond
RUN printf "cd $MIR_WWW_PATH\nphp ffkill.php"> /etc/periodic/15min/ffkill
RUN chmod +x /etc/periodic/15min/ffkill