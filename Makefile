MIKTEX = docker run -it --rm -v miktex-cjk:/var/lib/miktex -v `pwd`:/miktex/work -v /c/Windows/Fonts:/usr/share/fonts/windows:ro miktex/miktex

TEX = $(MIKTEX) xelatex
BIBTEX = $(MIKTEX) bibtex

init:
	docker volume create miktex-cjk
	docker pull miktex/miktex

update:
	$(MIKTEX) /bin/bash -c "fc-cache -fv && initexmf --update-fndb && initexmf --mkmaps && initexmf --mklinks --force && miktex packages update-package-database && miktex packages update"

pdf: cv.tex
	$(TEX) cv.tex
	# $(BIBTEX) cv
	# $(TEX) cv.tex
	$(TEX) cv.tex

clean:
	-rm *.aux *.out *.log *.bbl *.blg

distclean: clean
	-rm cv.pdf

