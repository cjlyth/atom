
tl;dr

```
docker run --rm -it -v $HOME/Downloads:/data cjlyth/atom
```

or..

```
docker build -t cjlyth/atom . && docker run --rm -it -v $(pwd):/data cjlyth/atom
find . -type f -name "*.deb" -exec sudo dpkg -i {} \;
```