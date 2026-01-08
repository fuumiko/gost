#!/bin/bash

set -e

BUILD_TARGET=linux-amd64v3

docker run --rm -it \
	-v $GOST_SRC_DIR:/gost \
	-v $GOST_DST_DIR:/gost-dst \
	golang:alpine \
	/bin/ash -c "cd /gost && apk update && apk add make && \
		make ${BUILD_TARGET} && \
		tar zcvf bin/gost-${BUILD_TARGET}.tar.gz bin/gost-${BUILD_TARGET} && \
		cp -f bin/gost-${BUILD_TARGET}.tar.gz /gost-dst/"

