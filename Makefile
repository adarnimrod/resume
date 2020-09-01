# Server name to upload
SERVER = host01.shore.co.il

# Destination folder on the server
DEST = /var/www/www.shore.co.il/resume

# Source resume
RESUME = resume.rst

# Output paper size
PAPERSIZE = A4

.PHONY: all clean publish test

all: resume.html resume.pdf resume.docx resume.odt

resume.html: $(RESUME) Makefile
	pandoc -s -t html5 --email-obfuscation=none $(RESUME) -o resume.html

resume.pdf: $(RESUME) Makefile
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -V documentclass=mycv -o resume.pdf

resume.docx: $(RESUME) Makefile
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.docx

resume.odt: $(RESUME) Makefile
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.odt

clean:
	git clean -fdX

publish: all
	rsync -az resume.html resume.pdf resume.odt resume.docx $(SERVER):$(DEST)
	ssh $(SERVER) "ln -sf resume.html $(DEST)/index.html"

test: clean all
