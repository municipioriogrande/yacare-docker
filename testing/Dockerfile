# Contains all dependencies needed to run Yacare.
FROM munirg/yacare:base
LABEL maintainer="Municipio Río Grande <tic.desarrollo@riogrande.gob.ar>"

# Configure PHP to allocate more memory and longer execution time
RUN sed -i -e '/max_execution_time = /s/30/6000/g' /etc/php.ini
RUN sed -i -e '/max_input_time = /s/60/12000/g' /etc/php.ini
RUN sed -i -e '/memory_limit = /s/128M/2048M/g' /etc/php.ini

# Copy parameters.yml
COPY data/parameters.yml /root
COPY data/.env.test /root

# Run entrypoint script
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN mkdir /root/yacare
COPY entry-point.sh /root
ENTRYPOINT ["sh", "/root/entry-point.sh", "--"]

EXPOSE 8000

CMD ["php", "bin/console", "server:run"]
