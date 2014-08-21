all: pdf html docx odt

pdf: resume.rst
	pandoc resume.rst -o resume.pdf

html: resume.rst
	pandoc -s resume.rst -o resume.html

docx: resume.rst
	pandoc resume.rst -o resume.docx

odt: resume.rst
	pandoc resume.rst -o resume.odt

clean:
	rm resume.html resume.pdf resume.docx resume.odt

publish: all
	echo "stub for publishing"
