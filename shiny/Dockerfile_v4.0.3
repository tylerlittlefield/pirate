FROM ubuntu:20.10 AS builder
ENV DEBIAN_FRONTEND=noninteractive

# ------------------------------------------------------------------------------
# Dependencies 
# ------------------------------------------------------------------------------
RUN apt update -y
RUN apt install -y gfortran \
    libreadline6-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    xvfb \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    texinfo \
    texlive \
    texlive-fonts-extra \
    screen \
    wget \
    libpcre2-dev \
    git \
    apt-utils \
    sed \
    make \
    cmake \
    g++ \
    default-jdk

# ------------------------------------------------------------------------------
# Install R
# ------------------------------------------------------------------------------
WORKDIR /usr/local/src
RUN wget https://cran.rstudio.com/src/base/R-4/R-4.0.3.tar.gz \
    && tar zxvf R-4.0.3.tar.gz
WORKDIR /usr/local/src/R-4.0.3
RUN ./configure --enable-R-shlib \
    && make -j4 \
    && make -j4 install
WORKDIR /usr/local/src/
RUN rm -rf R-4.0.3*
WORKDIR /

# ------------------------------------------------------------------------------
# Install R packages
# ------------------------------------------------------------------------------
RUN R -e "install.packages(c('shiny', 'Cairo'), repos='http://cran.rstudio.com/')"

# ------------------------------------------------------------------------------
# Install python 3
# ------------------------------------------------------------------------------
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------------------------
# Install shiny-server
# ------------------------------------------------------------------------------
# RUN git clone https://github.com/rstudio/shiny-server.git \
#     && mkdir shiny-server/tmp \
#     && cd / \
#     && git clone https://github.com/tylurp/shiny-server-arm.git \
#     && cp /shiny-server-arm/binding.gyp /shiny-server/tmp/binding.gyp \
#     && cp /shiny-server-arm/determine_arch.sh /shiny-server/determine_arch.sh \
#     && chmod +x /shiny-server/determine_arch.sh && \
#     && /shiny-server/determine_arch.sh
RUN git clone https://github.com/rstudio/shiny-server.git \
    && mkdir shiny-server/tmp \
    && cd / \
    && git clone https://github.com/tylurp/shiny-server-arm.git \
    && cp /shiny-server-arm/binding.gyp /shiny-server/tmp/binding.gyp \
    && sed -i '8s/.*/NODE_SHA256=976285886f734ac4e13be8b34586136499b088aa32c6430ca8eee166d167dca5/' shiny-server/external/node/install-node.sh \
    && sed -i 's/linux-x64.tar.xz/linux-arm64.tar.xz/' /shiny-server/external/node/install-node.sh \
    && sed -i 's/https:\/\/github.com\/jcheng5\/node-centos6\/releases\/download\//https:\/\/nodejs.org\/dist\//' /shiny-server/external/node/install-node.sh
WORKDIR /shiny-server/tmp/
RUN PYTHON=`which python` \
    && mkdir ../build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DPYTHON="$PYTHON" ../ \
    && make -j4 \
    && ../external/node/install-node.sh \
    && ../bin/node ../ext/node/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js configure \
    && ../bin/node ../ext/node/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js --python="$PYTHON" rebuild \
    && ../bin/npm --python="${PYTHON}" install --no-optional --unsafe-perm \
    && ../bin/npm --python="${PYTHON}" rebuild \
    && make -j4 install

# ------------------------------------------------------------------------------
# Clean up
# ------------------------------------------------------------------------------
FROM ubuntu:20.10
COPY --from=builder /usr/local/bin/R /usr/local/bin/R
COPY --from=builder /usr/local/lib/R /usr/local/lib/R
COPY --from=builder /usr/local/bin/Rscript /usr/local/bin/Rscript
COPY --from=builder /usr/local/shiny-server /usr/local/shiny-server
COPY --from=builder /shiny-server-arm /shiny-server-arm
WORKDIR /
RUN useradd -r -m shiny \
    && ln -s /usr/local/shiny-server/bin/shiny-server /usr/bin/shiny-server \
    && mkdir -p /var/log/shiny-server \
    && mkdir -p /srv/shiny-server \
    && chown shiny /var/log/shiny-server \
    && mkdir -p /var/lib/shiny-server \
    && mkdir -p /etc/shiny-server \
    && cp /shiny-server-arm/shiny-server.conf /etc/shiny-server/shiny-server.conf \
    && cp /shiny-server-arm/init.sh /etc/shiny-server/init.sh \
    && chmod 777 /etc/shiny-server/init.sh \
    && chmod -R 777 /var/log/shiny-server \
    && chmod -R 777 /srv/shiny-server \
    && chmod -R 777 /var/lib/shiny-server \
    && chmod -R 777 /srv/shiny-server \
    && apt update -y \
    && apt install -y \
       gfortran \
       libreadline6-dev \
       libcurl4-openssl-dev \
       libcairo2-dev \
       xvfb \
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
       libssl-dev \
       libxml2-dev \
       g++ \
       make
ENTRYPOINT ["/etc/shiny-server/init.sh"]