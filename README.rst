Nimrod Adar's resume
====================

My resume in RestructureText, make targets for generating PDF, HTML, ODT and
DOCX versions and uploading to my web server. The pre-prepared version are
available `here <https://www.shore.co.il/blog/pages/about-me.html>`_.

Dependencies
------------

Make, pandoc, rsync, pdflatex.

Usage
-----

To build the pdf version (same for odt, html, docx)::

    make pdf

To build all versions::

    make all

To upload to webserver (includes rebuilding all versions)::

    make publish

License
-------

This repository is licensed under the `Creative Commons 
Attribution 4.0 International (CC BY 4.0) license`
<http://creativecommons.org/licenses/by/4.0/>`_.
