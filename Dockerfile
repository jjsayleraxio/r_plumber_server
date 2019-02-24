FROM rocker/r-base

RUN apt-get update -qq && apt-get install -y \
  r-base \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev

RUN  Rscript -e "install.packages(c('data.table','DBI','stringr','devtools','plumber'))" 

EXPOSE 40000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=40000)"]
CMD ["/data/plumber.R"]
