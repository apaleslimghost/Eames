all: index.js

%.js: %.ls
	node_modules/.bin/lsc -pc $(LS_OPTS) "$<" > "$@"

test: all
	./node_modules/.bin/mocha -r LiveScript -u exports test.ls

.PHONY: clean
clean:
	rm -f index.js