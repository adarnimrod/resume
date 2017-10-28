# Server name to upload
SERVER = www.shore.co.il

# Destination folder on the server
DEST = /var/www/htdocs/www.shore.co.il/resume

# Source resume
RESUME = resume.rst

# Output paper size
PAPERSIZE = A4

.PHONY: all clean publish test

all: resume.html resume.pdf resume.docx resume.odt

resume.html: $(RESUME)
	pandoc -s -t html5 --email-obfuscation=none $(RESUME) -o resume.html

resume.pdf: $(RESUME)
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.pdf

resume.docx: $(RESUME)
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.docx

resume.odt: $(RESUME)
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.odt

clean:
	git clean -fdX

publish: all
	rsync -az resume.html resume.pdf resume.odt resume.docx $(SERVER):$(DEST)

test: clean all
