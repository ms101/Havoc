#/bin/bash
# see https://havocframework.com/docs/installation

sudo apt install -y git build-essential apt-utils cmake libfontconfig1 libglu1-mesa-dev libgtest-dev libspdlog-dev libboost-all-dev libncurses5-dev libgdbm-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev mesa-common-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5websockets5 libqt5websockets5-dev qtdeclarative5-dev golang-go qtbase5-dev libqt5websockets5-dev python3-dev libboost-all-dev mingw-w64 nasm

cd teamserver
go get golang.org/x/sys
go get github.com/ugorji/go
cd ..

make ts-build

git clone https://github.com/HavocFramework/Modules client/Modules --single-branch --branch main
test -d client/Build && rm -r client/Build

make client-build

echo -e "[*] run server with \n\t./havoc server --profile ./profiles/havoc.yaotl -v --debug-dev"
echo -e "[*] run client with  \n\t.havoc client"
