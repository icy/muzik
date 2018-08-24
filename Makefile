MS := $(shell \ls *.ly | sed -e 's|\.ly|.pdf|')

all: $(MS) local

%.pdf: %.ly
	lilypond "$<"
	touch -r "$<" "$(@)"

.PHONY: local
local:
	if test -f "local.sh"; then \
		./local.sh ; \
	fi

.PHONY: clean
clean:
	@rm -fv *.pdf *.jpg
