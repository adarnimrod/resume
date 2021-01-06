Nimrod Adar's resume
====================

.. image:: https://git.shore.co.il/nimrod/resume/badges/nimrod/pipeline.svg
    :target: https://git.shore.co.il/nimrod/resume/-/commits/nimrod
    :alt: pipeline status

My resume in RestructureText, make targets for generating PDF, HTML, ODT and
DOCX versions and uploading to my web server. The pre-prepared version are
available `here <https://www.shore.co.il/blog/pages/about-me.html>`_. The
version in the master branch is generic and without my resume, in the nimrod
branch are my resume and specific settings.

My own résumé is in the :code:`nimrod` branch, the outputted files can be found
in my `about me <https://www.shore.co.il/blog/pages/about-me.html>`_ page.

Dependencies
------------

- `Docker <https://www.docker.com/>`_ (for building).
- rsync (for uploading).

Usage
-----

The various settings (input file, server name to upload, etc.) are specified in
the :code:`Makefile`, adjust according to your needs.

To build the pdf version (same for odt, html, docx)

.. code:: shell

    docker run -itv "$PWD:/project" registry.shore.co.il/presentation make pdf

To build all versions

.. code:: shell

    docker run -itv "$PWD:/project" registry.shore.co.il/presentation make

To upload to webserver (includes rebuilding all versions)

.. code:: shell

    make publish

License
-------

This repository is licensed under the `Creative Commons
Attribution 4.0 International (CC BY 4.0) license
<http://creativecommons.org/licenses/by/4.0/>`_ (see :code:`LICENSE.txt`)

Author
------

Nimrod Adar, `contact me <nimrod@shore.co.il>`_ or visit my `website
<https://www.shore.co.il/>`_. Patches are welcome via `git send-email
<http://git-scm.com/book/en/v2/Git-Commands-Email>`_. The repository is located
at: https://git.shore.co.il/explore.
