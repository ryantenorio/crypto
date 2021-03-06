#!/usr/bin/env bash


DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

CMD="$1"
shift

build () {


 (cd "$DIR" && go build ./...)

}

test () {

 (cd "$DIR" && go test -cpu 1 -v ./...)

}

bench () {

 (cd "$DIR" && go test -v -cpu 1 -benchmem -bench=. ./...)
}

case "$CMD" in

 build )
   build
   ;;
 test )
   test
   ;;
 bench )
   bench
   ;;
 * )
   echo "build.sh build|test"

esac