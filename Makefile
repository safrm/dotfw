MARKDOWN = markdown
MDDOCS   = $(wildcard *.md)
HTMLDOCS = $(MDDOCS:%.md=docs/%.html)

docs/%.html: %.md
	$(MARKDOWN) $< > $@ || rm -f $@

all: $(HTMLDOCS)

install:
	install -m 755 dotfw /usr/bin
	install -m 755 dotfw-network /usr/bin
	install -m 755 dotfw-process /usr/bin

clean:
	rm -fr $(HTMLDOCS)

