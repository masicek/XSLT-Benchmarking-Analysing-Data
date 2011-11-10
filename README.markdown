XSLT Benchmarking - Analysing Data
==================================

This is part of [XSLT Benchmarking](https://github.com/masicek/XSLT-Benchmarking) project.
It contains part for analysing downloaded XSLT files and generate reports.

Scan
----
This part is in the subdirectory [./scan/](./XSLT-Benchmarking-Analysing-Data/tree/master/scan/).
It contains scripts for scannig of contents of all dowloaded XSLT files.
We watch maximal depth, XSLT version, element numbers etc.

Categories
----------
This part is in the subdirectory [./category/](./XSLT-Benchmarking-Analysing-Data/tree/master/category/).
It contains scrips for detecing categories.
For each downloaded XSLT templates is decide, if it belong to any of selected categories.

Reports
-------
This part is in subdirectory [./reports/](./XSLT-Benchmarking-Analysing-Data/tree/master/reports/).
It contains scripts for generating graphs and TeX tables from results of scannig and categorization.
Also, it contains scripts for generating TeX tables containg lists of criteria for detecing categories.
