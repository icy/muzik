MS := $(shell \ls *.ly | sed -e 's|\.ly|.pdf|')

all: $(MS)

%.pdf: %.ly
	@lilypond "$<"
	@touch -r "$<" "$(@)"

.PHONY: clean
clean:
	@rm -fv *.pdf
