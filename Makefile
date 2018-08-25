MS := $(shell \ls *.ly | sed -e 's|\.ly|.pdf|')

.PHONY: all build
build: $(MS)
all: build local

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
