rm = rm -f
pandoc = pandoc --filter=pandoc-citeproc --standalone

paper = paper.md
result = output.pdf

date = $(shell date +%m-%d-%y)
draftname = ethan-outline-draft-$(date).pdf

all: clean build

build:
	$(pandoc) $(paper) -o $(result)
#	open $(result)

.PHONY: clean
clean:
	$(rm) *.pdf

ship-draft: all
	cp $(result) $(draftname)
