FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
	&& apt-get install -y iputils-ping
##WORKDIR##
RUN mkdir /datos
WORKDIR /datos
RUN touch byrommelin.txt
RUN mkdir /datos2
WORKDIR /datos2
RUN touch byrommelin2.txt

##COPY##
COPY index.html .
COPY app.log /datos

##ADD##
ADD docs docs
ADD f* /datos/
ADD f.tar .

##ENV##
ENV dir=/data dir2=/data2
RUN mkdir $dir && mkdir $dir2

##EXPOSE##
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos2

##VOLUME##
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

##CMD##
CMD /datos2/entrypoint.sh

##ENTRYPOINT##
##ENTRYPOINT ["/bin/bash"]

