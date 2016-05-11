# ----------------------------------------------------------------- [ Makefile ]
#
# A Makefile for the thesis.
#
# ---------------------------------------------------------------------- [ EOH ]

# ------------------------------------------------------------------ [ Options ]
LATEXMK      := latexmk
LATEXMK_OPTS := -gg -pdf -bibtex

TEXCOUNT      := texcount
TEXCOUNT_OPTS := -inc -sub=chapter -sum

LACHECK := lacheck
CHKTEX  := chktex

THESIS      := thesis
DATE	    := ${shell date +%F}
THESIS_DATE := ${DATE}-${THESIS}

TEX_SOURCES := ${shell find . -name "*.tex"}
# ------------------------------------------------------------------ [ Targets ]

# ------------------------------------------------------------ [ LaTeX Linting ]
lacheck:
	${LACHECK} ${THESIS}.print.tex

chktex:
	${CHKTEX} -I ${THESIS}.print.tex

style-check:
	style-check.rb -v ${TEX_SOURCES}

# -------------------------------------------------------------- [ Word Counts ]
wordcount:
	${TEXCOUNT} -inc -1 ${THESIS}.print.tex

wordcount-verbose:
	${TEXCOUNT} -inc -sum ${THESIS}.print.tex

wordcount-total:
	${TEXCOUNT} -inc -total ${THESIS}.print.tex

# ----------------------------------------------------------------- [ Building ]

draft:
	${LATEXMK} ${LATEXMK_OPTS} ${THESIS}.draft.tex
	mv ${THESIS}.draft.pdf ${THESIS_DATE}.draft.pdf

print:
	${LATEXMK} ${LATEXMK_OPTS} ${THESIS}.print.tex

screen:
	${LATEXMK} ${LATEXMK_OPTS} ${THESIS}.screen.tex

electronic:
	${LATEXMK} ${LATEXMK_OPTS} ${THESIS}.electronic.tex

version:
	${LATEXMK} ${LATEXMK_OPTS} ${THESIS}.*n*.tex
	mv ${THESIS}.print.pdf ${THESIS_DATE}.print.pdf
	mv ${THESIS}.screen.pdf ${THESIS_DATE}.screen.pdf
	mv ${THESIS}.electronic.pdf ${THESIS_DATE}.electronic.pdf

proof: biblio figure ${TEX_SOURCES}
	${LATEXMK} ${LATEXMK_OPTS} ${THESIS}.draft.tex

draft: proof
	mv ${THESIS}.draft.pdf ${THESIS_DATE}.draft.pdf
# ----------------------------------------------------------------- [ Cleaning ]

clean:
	latexmk -c

cthulhu:
	latexmk -C
	rm -rf ${THESIS}*.pdf ${THESIS_DATE}
	find . -name "*~" -delete
	find . -maxdepth 1 -name "${THESIS_DATE}.*.pdf" -delete

# -------------------------------------------------------------------- [ Phony ]

.PHONY: cthulhu clean version draft print wordcount \
		wordcount-verbose wordcount-total chktex lacheck \
		style-check screen electronic proof

# ---------------------------------------------------------------------- [ EOF ]
