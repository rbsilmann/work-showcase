FROM httpd:2.4

RUN sed -i '/LoadModule cache_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule cache_disk_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule cache_socache_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

COPY ./cache.conf /usr/local/apache2/conf/extra/cache.conf
RUN echo "Include conf/extra/cache.conf" >> /usr/local/apache2/conf/httpd.conf