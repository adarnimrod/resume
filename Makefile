RESUME = resume.rst
CSS = resume.css
PAPERSIZE = A4

all: html pdf docx odt

html: $(RESUME)
	pandoc -s -t html5 --email-obfuscation=none -c resume.css $(RESUME) -o resume.html

pdf: $(RESUME)
	pandoc $(RESUME) -c $(CSS) -V papersize=$(PAPERSIZE) -o resume.pdf

docx: $(RESUME) html
	pandoc $(RESUME) -c $(CSS) -V papersize=$(PAPERSIZE) -o resume.docx

odt: $(RESUME) html
	pandoc $(RESUME) -c $(CSS) -V papersize=$(PAPERSIZE) -o resume.odt

clean:
	rm resume.html resume.pdf resume.docx resume.odt

publish: all
	rsync -az --exclude="$(RESUME)" --exclude="Makefile" --exclude="resume.css" ./ www.shore.co.il:/var/www/htdocs/www.shore.co.il/resume

clone:
	git push gitweb master
