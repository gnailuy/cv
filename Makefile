MIKTEX = docker run -it --rm -v miktex:/var/lib/miktex -v `pwd`:/miktex/work miktex/miktex

TEX = $(MIKTEX) xelatex
BIBTEX = $(MIKTEX) bibtex

pdf: cv.tex
	$(TEX) cv.tex
	# $(BIBTEX) cv
	# $(TEX) cv.tex
	$(TEX) cv.tex

init:
	docker volume create miktex
	docker pull miktex/miktex

update: init
	$(MIKTEX) /bin/bash -c "initexmf --update-fndb && initexmf --mkmaps && initexmf --mklinks --force && miktex packages update-package-database && miktex packages update"

clean:
	-rm *.aux *.out *.log *.bbl *.blg

distclean: clean
	-rm cv.pdf

