#!/usr/bin/env bash

git clone https://github.com/atom/atom.git /tmp/atom
pushd /tmp/atom &> /dev/null
git pull origin master
git reset --hard HEAD
echo "Compiling atom"
./script/build 2> /dev/null && {
	echo "Building debian package"
	./script/grunt mkdeb 2>/dev/null
}
find /tmp/atom-build -type f -name "*.deb" -exec cp {} /data/ \;
