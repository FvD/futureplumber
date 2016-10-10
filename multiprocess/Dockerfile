FROM rocker/r-base
MAINTAINER "Frans van Dunné" frans.vandunne@gmail.com
RUN R -e "install.packages('plumber')"
COPY . /app
WORKDIR /app
EXPOSE 9080
ENTRYPOINT ["Rscript"]
CMD ["startapi.R"]
