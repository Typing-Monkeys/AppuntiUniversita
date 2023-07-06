VIEWER = okular
INKSCAPE = inkscape

all:
	@echo "Compilazione del documento: lancia \"make pdf\" per generare i pdf"
	pdflatex main.tex
	pdflatex main.tex
	@echo "Compilazione del documento completata: apri il file \"main.pdf\""

pdf:
	cd images/svg && sh extract.sh $(INKSCAPE)

exe:
	$(VIEWER) main.pdf

clean:
	rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.lot *.lof *.out *.bbl *.blg *.lol *.pdf *.backup
	rm -f images/*.pdf

