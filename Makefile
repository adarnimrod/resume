resume = resume.rst
css = resume.css
papersize = A4

all: html pdf docx odt

html: $(resume)
	pandoc -s -t html5 --email-obfuscation=none -c resume.css $(resume) -o resume.html

pdf: $(resume)
	pandoc $(resume) -c $(css) -V papersize=$(papersize) -o resume.pdf

docx: $(resume) html
	pandoc $(resume) -c $(css) -V papersize=$(papersize) -o resume.docx

odt: $(resume) html
	pandoc $(resume) -c $(css) -V papersize=$(papersize) -o resume.odt

clean:
	rm resume.html resume.pdf resume.docx resume.odt

publish: all
	rsync -az --exclude="$(resume)" --exclude="Makefile" --exclude="resume.css" ./ www.shore.co.il:/var/www/htdocs/www.shore.co.il/resume
