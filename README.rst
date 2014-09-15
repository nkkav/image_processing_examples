=======================================
 image_processing_examples user manual
=======================================

+-------------------+----------------------------------------------------------+
| **Title**         | image_processing_examples                                |
+-------------------+----------------------------------------------------------+
| **Authors**       | Martin J. Thompson 2010-2014 (original version)          |
+-------------------+----------------------------------------------------------+
|                   | Nikolaos Kavvadias (C) 2014 (fork)                       |
+-------------------+----------------------------------------------------------+
| **Contact**       | martin@parallelpoints.com (author of orig. version)      |
+-------------------+----------------------------------------------------------+
|                   | nikos@nkavvadias.com (fork extensions)                   |
+-------------------+----------------------------------------------------------+
| **Source**        | https://github.com/nkkav/image_processing_examples       |
+-------------------+----------------------------------------------------------+
| **Website**       | http://www.parallelpoints.com (original version)         |
+-------------------+----------------------------------------------------------+
|                   | http://www.nkavvadias.com (fork)                         |
+-------------------+----------------------------------------------------------+

.. _link: http://url.to/some/path/


1. Introduction
===============

This is a collection of image processing primitives in the form of VHDL 
packages. The packages provide support for reading and writing PNM (PBM, PGM, 
PPM) image files. The main use of ``image_processing_examples`` is expected to 
be as part of testbench code for rapidly testing and validating concepts of 
image processing IP.

This README is part of Nikolaos Kavvadias' forked version which is available at: 
https://github.com/nkkav/image_processing_examples

In order to visualize PNM files, the public domain ``Imagine`` viewer is good 
choice: http://www.nyam.pe.kr/

Reference documentation for this project can be found in the top-level 
directory of the distribution in plain text, HTML and PDF form.


2. File listing
===============

The ``image_processing_examples`` or IPE (ipe) distribution includes the 
following files. Added files or directories are marked with an *A* while 
modified files/directories are marked within an *M*. Files removed compared to 
the original version are marked as *R*. All original files in the pre-fork 
version are copyright of Martin J. Thompson.

+-----------------------+------------------------------------------------------+
| /ipe                  | Top-level directory                                  |
+-----------------------+------------------------------------------------------+
| *A* AUTHORS           | List of authors.                                     |
+-----------------------+------------------------------------------------------+
| *A* LICENSE           | License agreement (2-clause MIT/BSD license).        |
+-----------------------+------------------------------------------------------+
| *A* README.rst        | This file.                                           |
+-----------------------+------------------------------------------------------+
| *A* README.html       | HTML version of README.                              |
+-----------------------+------------------------------------------------------+
| *A* README.pdf        | PDF version of README.                               |
+-----------------------+------------------------------------------------------+
| *A* rst2docs.sh       | Bash script for generating the HTML and PDF versions |
|                       | of README.                                           |
+-----------------------+------------------------------------------------------+
| /ipe/hdl              | VHDL code for packages and testbenches               |
+-----------------------+------------------------------------------------------+
| doit                  | Bash script for running GHDL on pgm.vhd package and  |
|                       | testbench.                                           |
+-----------------------+------------------------------------------------------+
| *A* feep_16.pgm       | 24x7 test PGM image with 16 grey levels.             |
+-----------------------+------------------------------------------------------+
| *A* j_ascii.pbm       | 6x10 test PBM image showing the capital letter J.    |
+-----------------------+------------------------------------------------------+
| *M* libv.vhd          | Helper package with various definitions including a  |
|                       | positive logic ``assert`` (``assert_equal``).  Moved |
|                       | sample testbench to separate file.                   |
+-----------------------+------------------------------------------------------+
| *A* pbm.vhd           | ``pbm`` package for reading/writing PBM images.      |
+-----------------------+------------------------------------------------------+
| *M* pgm.vhd           | ``pgm`` package for reading/writing PGM images.      |
|                       | Moved sample testbench to separate file.             |
+-----------------------+------------------------------------------------------+
| *A* ppm.vhd           | ``ppm`` package for reading/writing PPM images.      |
+-----------------------+------------------------------------------------------+
| *A* rgb.ppm           | Sample 4x2 ASCII PPM image.                          |
+-----------------------+------------------------------------------------------+
| *A* tb_libv.mk        | GHDL Makefile for testing the ``libv`` package.      |
+-----------------------+------------------------------------------------------+
| *A* tb_libv.sh        | Bash script for running the GHDL simulation for      |
|                       | the ``tb_libv.vhd`` testbench.                       |
+-----------------------+------------------------------------------------------+
| *A* tb_libv.vhd       | Bash script for running the GHDL simulation for      |
|                       | the ``tb_libv.vhd`` testbench.                       |
+-----------------------+------------------------------------------------------+
| *A* tb_pbm.mk         | GHDL Makefile for testing the ``pbm`` package.       |
+-----------------------+------------------------------------------------------+
| *A* tb_pbm.sh         | Bash script for running the GHDL simulation for      |
|                       | the ``tb_pbm.vhd`` testbench.                        |
+-----------------------+------------------------------------------------------+
| *A* tb_pbm.vhd        | Bash script for running the GHDL simulation for      |
|                       | the ``tb_pbm.vhd`` testbench. Generates the          |
|                       | ``test_write.pbm`` image.                            |
+-----------------------+------------------------------------------------------+
| *R* tb_pgm            | Executable for pgm.vhd (incl testbench) generated by |
|                       | GHDL.                                                |
+-----------------------+------------------------------------------------------+
| *A* tb_pgm.mk         | GHDL Makefile for testing the ``pgm`` package.       |
+-----------------------+------------------------------------------------------+
| *A* tb_pgm.sh         | Bash script for running the GHDL simulation for      |
|                       | the ``tb_pgm.vhd`` testbench.                        |
+-----------------------+------------------------------------------------------+
| *A* tb_pgm.vhd        | Bash script for running the GHDL simulation for      |
|                       | the ``tb_pgm.vhd`` testbench. Generates the          |
|                       | ``test_write.pgm`` image.                            |
+-----------------------+------------------------------------------------------+
| *A* tb_ppm.mk         | GHDL Makefile for testing the ``ppm`` package.       |
+-----------------------+------------------------------------------------------+
| *A* tb_ppm.sh         | Bash script for running the GHDL simulation for      |
|                       | the ``tb_ppm.vhd`` testbench.                        |
+-----------------------+------------------------------------------------------+
| *A* tb_ppm.vhd        | Bash script for running the GHDL simulation for      |
|                       | the ``tb_ppm.vhd`` testbench. Generates the          |
|                       | ``test_write.ppm`` image.                            |
+-----------------------+------------------------------------------------------+
| *A* tb_ppm_tpat.mk    | GHDL Makefile for testing the ``ppm`` package        |
|                       | by generating a test pattern image.                  |
+-----------------------+------------------------------------------------------+
| *A* tb_ppm_tpat.sh    | Bash script for running the GHDL simulation for      |
|                       | the ``tb_ppm_tpat.vhd`` testbench.                   |
+-----------------------+------------------------------------------------------+
| *A* tb_ppm_tpat.vhd   | Bash script for running the GHDL simulation for      |
|                       | the ``tb_ppm_tpat.vhd`` testbench. Generates the     |
|                       | ``test_write_tpat.ppm`` image.                       |
+-----------------------+------------------------------------------------------+
| *A* test_write.pbm    | 8x8 ASCII PBM image generated by ``tb_pbm.vhd``.     |
+-----------------------+------------------------------------------------------+
| *A* test_write.pgm    | 8x8 ASCII PGM image generated by ``tb_pgm.vhd``.     |
+-----------------------+------------------------------------------------------+
| *A* test_write.ppm    | 8x8 ASCII PPM image generated by ``tb_ppm.vhd``.     |
+-----------------------+------------------------------------------------------+
| *A* tpat_write.pbm    | 320x240 test pattern ASCII PPM image generated by    |
|                       | ``tb_ppm_tpat.vhd``.                                 |
+-----------------------+------------------------------------------------------+
| *A* testimage.pbm     | 8x4 binary PBM test image.                           |
+-----------------------+------------------------------------------------------+
| testimage.pgm         | 8x4 binary PGM test image.                           |
+-----------------------+------------------------------------------------------+
| *A* testimage.ppm     | 8x4 binary PPM test image.                           |
+-----------------------+------------------------------------------------------+
|*A* testimage_ascii.pbm| 8x4 ASCII PBM test image.                            |
+-----------------------+------------------------------------------------------+
| testimage_ascii.pgm   | 8x4 ASCII PGM test image.                            |
+-----------------------+------------------------------------------------------+
| testimage_ascii.ppm   | 8x4 ASCII PPM test image.                            |
+-----------------------+------------------------------------------------------+
| /ipe/high_level       | High-level (MATLAB) code for various image processing|
|                       | algorithms                                           |
+-----------------------+------------------------------------------------------+
| corners.m             | MATLAB code invoking Shi-Tomasi and generating a PNG |
|                       | image.                                               |
+-----------------------+------------------------------------------------------+
| edge_compare_noisy.m  | Applies either a Sobel or a simple edge detector.    |
+-----------------------+------------------------------------------------------+
| edges.m               | Applies vertical and horizontal edge filter and      |
|                       | produces PNG images for the intermediate and final   |
|                       | results.                                             |
+-----------------------+------------------------------------------------------+
| shi_tomasi.m          | Applies the Shi-Tomasi method to an image data       |
|                       | structure.                                           |
+-----------------------+------------------------------------------------------+
| try_edge_mask.m       | Similar to edges.m, tests edge masks.                |
+-----------------------+------------------------------------------------------+
| try_edge_mask.sci     | Scilab version of the above.                         |
+-----------------------+------------------------------------------------------+


3. Simulation
=============

The ``image_processing_examples`` testbenches can be run using the supplied 
GNU Makefiles and Bash shell scripts using the GHDL simulator. 
simulation.

3.1. GHDL
---------

For running the GHDL simulation, change directory to the ``/hdl`` 
subdirectory:

| ``$ cd $IPE_HOME/hdl``
 
assuming ``IPE_HOME`` is the directory where the top-level ``/ipe`` is 
found. 

Then, the corresponding shell script is executed, e.g. for producing a PPM test 
image:

| ``$ ./tb_ppm.sh``

The simulation reads the ``testimage_ascii.ppm`` PPM image file and writes a 
new image file to ``test_write.ppm``.

3.2. Modelsim
-------------

Scripts for running an Exemplar/Mentor Modelsim simulation may be added in the 
future.


4. Synthesis
============

The ``pbm/pgm/ppm`` and ``libv`` package code is not expected to synthesize 
using logic synthesis tools. Its main purpose is for rapid exploration of 
image processing primitives in testbench code.


5. Prerequisities
=================

- Standard UNIX-based tools (tested with gcc-4.6.2 on MinGW/x86).
  
  * make
  * bash (shell)
   
  For this reason, MinGW (http://www.mingw.org) or Cygwin 
  (http://sources.redhat.com/cygwin) are suggested, since POSIX emulation 
  environments of sufficient completeness.
  
- GHDL simulator (http://ghdl.free.fr) or Modelsim (http://www.model.com).
  The latest GHDL distribution (0.29.1, Windows version) also installs GTKwave 
  on Windows.


6. Contact
==========

You may contact me at:

|  Nikolaos Kavvadias <nikos@nkavvadias.com>
|  http://www.nkavvadias.com
