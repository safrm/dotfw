MARKDOWN = markdown
MDDOCS   = $(wildcard *.md)
HTMLDOCS = $(MDDOCS:%.md=doc/htmlpages/%.html)

doc/htmlpages/%.html: %.md
	$(MARKDOWN) $< > $@ || rm -f $@

all: $(HTMLDOCS)
	 [ -a jss-docs-update ]; then jss-docs-update ./doc ; fi

install:
	mkdir -p $(DESTDIR)/usr/bin
	install -m 755 dotfw $(DESTDIR)/usr/bin
	install -m 755 dotfw-network $(DESTDIR)/usr/bin
	install -m 755 dotfw-process $(DESTDIR)/usr/bin

clean:
	rm -fr $(HTMLDOCS)

