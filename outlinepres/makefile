rm = rm -rf

css = style.css
pres = pres.html
slides = slides.md
img = img/

pandoc = pandoc -s -i -t revealjs --mathjax --slide-level=2 -c $(css) -o $(pres) $(slides)

tbdir = $(shell basename `pwd`)-pres
tgz = $(tbdir).tar.gz
zip = $(tbdir).zip
revealdir = reveal.js

all: clean build

build:
	$(pandoc)

.PHONY: clean

clean:
	$(rm) *.html
	$(rm) $(tbdir)
	$(rm) $(tgz)
	$(rm) $(zip)

download_revealjs:
		wget https://github.com/hakimel/reveal.js/archive/master.tar.gz
		tar -xzvf master.tar.gz
		mv reveal.js-master $(revealdir)
		rm master.tar.gz

remove_revealjs:
	$(rm) -r reveal.js

setup: remove_revealjs download_revealjs all

zip: prepcompressdirs
	zip $(zip) $(tbdir)
	$(rm) $(tbdir)

tarball: prepcompressdirs
	tar -cvzf $(tgz) $(tbdir)
	$(rm) $(tbdir)

prepcompressdirs: all
	mkdir $(tbdir)
	cp $(pres) $(tbdir)
	cp $(css) $(tbdir)
	cp -r $(img) $(tbdir)
	cp -r $(revealdir) $(tbdir)
