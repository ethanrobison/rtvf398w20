rm = rm -rf
level = --slide-level=2
css = style.css
pres = pres.html
slides = slides.md
revealdir = reveal.js

tbdir = $(shell basename `pwd`)-pres
tgz = $(tbdir).tar.gz

all: clean build

build:
	pandoc -s -i \
		--mathjax \
		-t revealjs \
		$(level) \
		-c $(css) \
		-o $(pres) \
		slides.md

.PHONY: clean

clean:
	$(rm) *.html
	$(rm) $(tbdir)
	$(rm) $(tgz)

download_revealjs:
		wget https://github.com/hakimel/reveal.js/archive/master.tar.gz
		tar -xzvf master.tar.gz
		mv reveal.js-master $(revealdir)
		rm master.tar.gz

remove_revealjs:
	$(rm) -r reveal.js

setup: remove_revealjs download_revealjs all

tarball: all
	mkdir $(tbdir)
	cp $(pres) $(tbdir)
	cp $(css) $(tbdir)
	cp -r $(revealdir) $(tbdir)
	tar -cvzf $(tgz) $(tbdir)
	$(rm) $(tbdir)
