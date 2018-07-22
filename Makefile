TEX = docker run -it --rm -v `pwd`/miktex:/miktex/.miktex -v `pwd`:/miktex/work miktex/miktex xelatex

pdf: cv.tex
	mkdir -p `pwd`/miktex
	$(TEX) cv.tex

clean:
	-rm *.aux *.out *.log

distclean: clean
	-rm cv.pdf

