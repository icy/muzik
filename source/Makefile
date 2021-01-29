MS := $(shell \ls *.ly | grep -v 'ff-' | sed -e 's|\.ly|.pdf|')

.PHONY: all build
build: $(MS)
all: build local

%.pdf: %.ly
	lilypond "$<" || ( rm -f "$(@)"; exit 1 ; )
	touch -r "$<" "$(@)"
	sed -r -e '/context FretBoards/d' \
		< "$<" \
		> ff-$<
	lilypond "ff-$<"
	touch -r "$<" "ff-$(@)"

.PHONY: local
local:
	if test -f "local.sh"; then \
		./local.sh ; \
	fi

.PHONY: clean
clean:
	@rm -fv *.pdf *.jpg ff-*
