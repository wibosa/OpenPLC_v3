FROM debian:bullseye-20211201

COPY . /workdir
WORKDIR /workdir

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

RUN python -m pip install -r requirements.txt; \ 
    ./install.sh docker;



ENTRYPOINT ["./start_openplc.sh"]
