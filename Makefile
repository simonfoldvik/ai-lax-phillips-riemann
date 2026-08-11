# build all: `make -j`
# clean all: `make clean`

LATEXMK      ?= latexmk
LATEXMKFLAGS ?= -pdf -interaction=nonstopmode -halt-on-error -file-line-error

TEX_SOURCES := $(wildcard */Main.tex)
PDF_TARGETS := $(TEX_SOURCES:.tex=.pdf)

.PHONY: all
all: $(PDF_TARGETS)

%/Main.pdf: %/Main.tex
	$(LATEXMK) -cd $(LATEXMKFLAGS) $<

.PHONY: clean
clean:
	$(LATEXMK) -cd -C $(TEX_SOURCES)
