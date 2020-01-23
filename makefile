rm = rm -f
level = --slide-level=2

all: clean build

build:
	pandoc -s -i \
		--mathjax \
		-t revealjs \
		$(level) \
		-c style.css \
		-o pres.html \
		slides.md

.PHONY: clean

clean:
	$(rm) *.html

download_revealjs:
		wget https://github.com/hakimel/reveal.js/archive/master.tar.gz
		tar -xzvf master.tar.gz
		mv reveal.js-master reveal.js
		rm master.tar.gz

remove_revealjs:
	$(rm) -r reveal.js

setup: remove_revealjs download_revealjs all
