# Server name to upload
SERVER = host01.shore.co.il

# Destination folder on the server
DEST = /var/www/www.shore.co.il/resume

# Source resume
RESUME = resume.rst

# Output paper size
PAPERSIZE = A4

# Allow saving files in a different directory
DESTDIR ?= .

OUTPUTS = $(DESTDIR)/resume.html $(DESTDIR)/resume.pdf $(DESTDIR)/resume.docx $(DESTDIR)/resume.odt

.PHONY: all
all: $(OUTPUTS)

$(DESTDIR)/resume.html: $(RESUME)
	mkdir -p $(DESTDIR)
	pandoc --standalone \
		   --to html5 \
		   --email-obfuscation none \
		   --output $@ \
		   $<

$(DESTDIR)/resume.pdf: $(RESUME)
	mkdir -p $(DESTDIR)
	pandoc --pdf-engine xelatex \
		   --metadata 'mainfont=SILEOT.ttf' \
		   --variable 'papersize=$(PAPERSIZE)' \
		   --variable 'documentclass=mycv' \
		   --output $@ \
		   $<

$(DESTDIR)/resume.docx: $(RESUME)
	mkdir -p $(DESTDIR)
	pandoc --variable 'papersize=$(PAPERSIZE)' --output $@ $<

$(DESTDIR)/resume.odt: $(RESUME)
	mkdir -p $(DESTDIR)
	pandoc --variable 'papersize=$(PAPERSIZE)' --output $@ $<

.PHONY: clean
clean:
	git clean -fdX

.PHONY: publish
publish: all
	rsync -az $(OUTPUTS) $(SERVER):$(DEST)
	ssh $(SERVER) "ln -sf resume.html $(DEST)/index.html"

.PHONY: test
test: clean all
