# Contains all dependencies needed to run Yacare.
FROM carlosafrias/yacare:base
LABEL maintainer="Carlos Frias <carlos.a.frias@gmail.com>"

# Configure PHP to allocate more memory and longer execution time
RUN sed -i -e '/max_execution_time = /s/30/6000/g' /etc/php.ini
RUN sed -i -e '/max_input_time = /s/60/12000/g' /etc/php.ini
RUN sed -i -e '/memory_limit = /s/128M/2048M/g' /etc/php.ini

# This allows to remove whatever folder has been created within de container from the host, after container
# has run tests.
RUN groupadd docker
RUN adduser -g docker test
USER test

# Copy parameters.yml
COPY data/parameters.yml /home/test/

# Run entrypoint script
COPY entry-point.sh /home/test
ENTRYPOINT ["sh", "/home/test/entry-point.sh", "--"]

EXPOSE 8000

CMD ["php", "bin/console", "server:run"]
