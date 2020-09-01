# Server name to upload
SERVER = hostname.tld

# Destination folder on the server
DEST = /var/www/resume

# Source resume
RESUME = resume.rst

# Output paper size
PAPERSIZE = A4

OUTPUTS = resume.html resume.pdf resume.docx resume.odt

.PHONY: all
all: $(OUTPUTS)

resume.html: $(RESUME)
	pandoc --standalone \
		   --to html5 \
		   --email-obfuscation none \
		   --output $@ \
		   $<

resume.pdf: $(RESUME)
	pandoc --pdf-engine xelatex \
		   --metadata 'mainfont=SILEOT.ttf' \
		   --variable 'papersize=$(PAPERSIZE)' \
		   --variable 'documentclass=mycv' \
		   --output $@ \
		   $<

resume.docx: $(RESUME)
	pandoc --variable 'papersize=$(PAPERSIZE)' --output $@ $<

resume.odt: $(RESUME)
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
