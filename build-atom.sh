#!/usr/bin/env bash

git clone https://github.com/atom/atom.git /tmp/atom
pushd /tmp/atom &> /dev/null
git fetch --all
git reset --hard ${ATOM_TAG:-master}
echo "Compiling atom"
./script/build 2> /dev/null && {
	echo "Building debian package"
	./script/grunt mkdeb 2>/dev/null && {
		find /tmp/atom-build -type f -name "*.deb" -exec cp {} /data/ \;
	} || {
		echo "Debian package failed!"	
	}
	
} || {
	echo "Compile failed!"
}

