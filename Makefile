# TEX = docker run -it --rm -v `pwd`/miktex:/miktex/.miktex -v `pwd`:/miktex/work miktex/miktex xelatex
TEX = docker run -it --rm -v `pwd`/miktex:/miktex/.miktex -v `pwd`:/miktex/work gnailuy/miktex xelatex

image:
	docker build -t gnailuy/miktex .

pdf: cv.tex
	mkdir -p `pwd`/miktex
	$(TEX) cv.tex

clean:
	-rm *.aux *.out *.log

distclean: clean
	-rm cv.pdf
