.PHONY: all silent

all: *.tex
	pdflatex app
	pdflatex app
	# I cannot figure out Make conditional syntax for the life of me
	$(shell if [[ $(grep cite *.tex) == *cite* ]]; then bibtex app $(BIBOPTIONS); fi)
	pdflatex app
	pdflatex app

clean:
	rm -f *.blg *.bbl *.aux *.log *.out *~ *.tdo

cleanPDFs:
	rm -f *.pdf *.tar.gz

clear: clean cleanPDFs

