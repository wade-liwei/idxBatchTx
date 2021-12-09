nodes = 5
joinNewNodeNum = 3
txs  = 10
index = 4
Join = false
#fast-sync = false
webrtc = false

BUILDDIR ?= $(CURDIR)/build
DOCKER_BUILDDIR= /
HASHRS_DAEMON_BINARY = nameserviced

up: conf start
joinup: joinConf joinStart
upjoin: up joinup



build:
	mkdir -p $(BUILDDIR) 
	go build    -o $(BUILDDIR)/nameserviced  ./cmd/nameserviced/
	go install ./cmd/nameserviced/ 
	sudo   DOCKER_BUILDKIT=1   docker build . -t  nameserviced

build-docker-ouput: go.sum  # build 的目录在docker image 里不能上下复制，不清楚原因；
	mkdir -p $(DOCKER_BUILDDIR)
	go build  -o $(DOCKER_BUILDDIR) ./cmd/nameserviced/


# generate keys and peers.json file
conf :
	rm -rf conf
	./scripts/build-conf.sh $(nodes)

# launch testnet
start:
	./scripts/run-testnet.sh $(nodes) $(Join) $(webrtc)

# stop testnet
stop:
	./scripts/stop-testnet.sh

# leave cleanly - removing itself from peer-set
leave:
	 ./scripts/leave.sh $(index)

joinConf:
		./scripts/join.sh $(joinNewNodeNum)

joinStart:
		./scripts/run-testnet.sh $(joinNewNodeNum) true


.PHONY: up build conf start watch stop show bombard send join leave demo
