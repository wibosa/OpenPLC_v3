FROM debian:bullseye-20211201

RUN apt update; \
    apt install -y \ 
	apt-utils \
	gcc\
	make \
	cmake \
	bison \
 	flex \
	vim \
	git \
	libtool \
        sqlite3 \
	python3 \
	python3-pip \
	curl \
	pkg-config \
	; \
    apt clean ;  
RUN python3 -m pip install -U flask flask-login pyserial pymodbus ;  

COPY . /workdir
WORKDIR /workdir

RUN ./install2.sh custom

ENTRYPOINT ["./start_openplc.sh"]
