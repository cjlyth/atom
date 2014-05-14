
tl;dr

```
docker run --rm -it -v $HOME/Downloads:/data cjlyth/atom
```

or 

```
docker run -it --name atom_build cjlyth/atom

docker run --rm -it \
  --volumes-from atom_build \
  -v $(pwd):/extract \
  dockerfile/ubuntu find /data -type f -name "*.deb" -exec cp {} /extract \;
```

or

```
docker run --rm -it -v $(pwd):/data cjlyth/atom
find . -type f -name "*.deb" -exec sudo dpkg -i {} \;
```