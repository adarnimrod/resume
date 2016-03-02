Nimrod Adar's resume
====================

My resume in RestructureText, make targets for generating PDF, HTML, ODT and
DOCX versions and uploading to my web server. The pre-prepared version are
available `here <https://www.shore.co.il/blog/pages/about-me.html>`_.

Dependencies
------------

Make, pandoc, rsync, pdflatex (in :code:`Debian texlive-latex-base` provides
pdflatex, also 'texlive-fonts-recommended' is needed for the fonts it provides).

Usage
-----

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
at: https://www.shore.co.il/cgit/.
