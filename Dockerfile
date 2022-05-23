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

COPY . /workdir
WORKDIR /workdir

RUN python3 -m pip install -r requirements.txt; \ 
    ./install.sh custom;

ENTRYPOINT ["./start_openplc.sh"]
