resume = resume.rst
papersize = A4

all: html pdf docx odt

html: $(resume)
	pandoc -s -t html5 --email-obfuscation=none -c resume.css $(resume) -o resume.html

pdf: $(resume) html
	pandoc resume.html -V papersize=$(papersize) -o resume.pdf

docx: $(resume) html
	pandoc resume.html -V papersize=$(papersize) -o resume.docx

odt: $(resume) html
	pandoc resume.html -V papersize=$(papersize) -o resume.odt

clean:
	rm resume.html resume.pdf resume.docx resume.odt

publish: all
	echo "stub for publishing"
