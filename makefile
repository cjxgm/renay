
all:

clean:
	rm -rf pkgbuild renay

install: pkg
	sudo pacman -U pkgbuild/*.pkg.tar.xz

pkg: preparepkg pkgtar makepkg

preparepkg:
	rm -rf pkgbuild
	cp -r pkg pkgbuild

makepkg: pkgtar
	(cd pkgbuild; makepkg)

pkgtar: renay-server remate
	rm -rf renay
	mkdir renay
	cp $^ renay
	tar cvf pkgbuild/renay.tar renay


