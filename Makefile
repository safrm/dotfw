MARKDOWN = markdown
MDDOCS   = $(wildcard *.md)
HTMLDOCS = $(MDDOCS:%.md=docs/%.html)

docs/%.html: %.md
	$(MARKDOWN) $< > $@ || rm -f $@

all: $(HTMLDOCS)

install:
	install -m 755 dotfw /usr/bin

clean:
	rm -fr $(HTMLDOCS)

