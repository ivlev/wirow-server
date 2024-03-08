#! /bin/bash

apt-get install -y apt-utils software-properties-common \
                   apt-transport-https sudo curl wget gpg

wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null \
       | gpg --dearmor -i \
       | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
wget -qO- https://deb.nodesource.com/setup_lts.x | bash -
wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

apt-add-repository -y 'deb https://apt.kitware.com/ubuntu/ focal main'
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update
apt-get install -y autoconf automake pkgconf \
  binutils build-essential ca-certificates cmake \
  g++ gcc git libtool make ninja-build nodejs python-is-python3 yarn \
  yasm python3-pip

git clone --recurse-submodules https://github.com/wirow-io/wirow-server.git

mkdir -p ./wirow-server/build && cd ./wirow-server/build

cmake ..  -G Ninja \
          -DCMAKE_BUILD_TYPE=RelWithDebInfo \
          -DIW_EXEC=ON
ninja
