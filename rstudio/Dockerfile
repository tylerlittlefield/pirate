FROM amoselb/rstudio-m1:latest

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    libxml2-dev \
    libssl-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libatomic1 \
    libgomp1 \
    libpcre2-8-0 \
    cron \
    unixodbc-dev \
    odbc-postgresql

RUN R -e "install.packages(c('cronR', 'aws.s3'), repos='http://cran.rstudio.com/')"
ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
