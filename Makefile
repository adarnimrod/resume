RESUME = resume.rst
PAPERSIZE = A4
SERVER = www.shore.co.il
DEST = /var/www/htdocs/www.shore.co.il/resume

.PHONY: all clean publish test

resume.html: $(RESUME)
	pandoc -s -t html5 --email-obfuscation=none $(RESUME) -o resume.html

resume.pdf: $(RESUME)
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.pdf

resume.docx: $(RESUME)
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.docx

resume.odt: $(RESUME)
	pandoc $(RESUME) -V papersize=$(PAPERSIZE) -o resume.odt

all: resume.html resume.pdf resume.docx resume.odt

clean:
	rm -f resume.html resume.pdf resume.docx resume.odt

publish: all
	rsync -az resume.html resume.pdf resume.odt resume.docx $(SERVER):$(DEST)

test: clean all
