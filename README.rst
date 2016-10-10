Resume generator
================

A (very) little framework to generate your resume from whatever markup that
suits you (and that Pandoc can read).

My own resume is in the :code:`nimrod` branch, the outputed files can be found
in my `about me <https://www.shore.co.il/blog/pages/about-me.html>`_ page.

Dependencies
------------

Make, pandoc, rsync, pdflatex (in Debian texlive-latex-base provides pdflatex,
also texlive-fonts-recommended is needed for the fonts it provides).

Usage
-----

The various settings (input file, server name to upload, etc.) are specified in
the :code:`Makefile`, adjust according to your needs.

To build the pdf version (same for odt, html, docx)

.. code:: shell

    make pdf

To build all versions

.. code:: shell

    make all

To upload to webserver (includes rebuilding all versions)

.. code:: shell

    make publish

License
-------

This repository is licensed under the `Creative Commons 
Attribution 4.0 International (CC BY 4.0) license
<http://creativecommons.org/licenses/by/4.0/>`_.

Author
------

Nimrod Adar, `contact me <nimrod@shore.co.il>`_ or visit my `website
<https://www.shore.co.il/>`_. Patches are welcome via `git send-email
<http://git-scm.com/book/en/v2/Git-Commands-Email>`_. The repository is located
at: https://www.shore.co.il/git/.
