FIGS=$(wildcard Figures/*.pdf)
TEXS=$(wildcard *.tex)
PAPER = Document

all:	clean $(PAPER).pdf

$(PAPER).pdf:	$(TEXS) $(FIGS) $(PAPER).bib
	touch $(PAPER).glo
	rubber -d $(PAPER).tex

clean:
	rubber -d --clean $(PAPER).tex
	rm -f $(PAPER).out
	rm -f $(PAPER).cov
	rm -f $(PAPER).glo
	rm -f $(PAPER).par
	rm -f $(PAPER).xdy
	rm -f $(PAPER).acn

.PHONY:	all clean
