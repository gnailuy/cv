# TEX = docker run -it --rm -v `pwd`/miktex:/miktex/.miktex -v `pwd`:/miktex/work gnailuy/miktex xelatex
TEX = docker run -it --rm -v `pwd`/miktex:/miktex/.miktex -v `pwd`:/miktex/work miktex/miktex xelatex
BIBTEX = docker run -it --rm -v `pwd`/miktex:/miktex/.miktex -v `pwd`:/miktex/work miktex/miktex bibtex

pdf: cv.tex
	mkdir -p `pwd`/miktex
	$(TEX) cv.tex
	$(BIBTEX) cv
	$(TEX) cv.tex
	$(TEX) cv.tex

clean:
	-rm *.aux *.out *.log

distclean: clean
	-rm cv.pdf

image:
	docker build -t gnailuy/miktex .

