FROM tylurp/pirate-plumber:v4.0.3

RUN apt update -y \
    && install2.r remotes \
    && mkdir /api
COPY . /api
RUN cd /api \
    && Rscript -e 'remotes::install_deps()' \
    && R CMD INSTALL .

CMD ["/api/inst/plumber/v1/plumber.R"]