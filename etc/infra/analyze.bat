@echo off
set PATH=%PATH%;c:\Documents\Software\Pellet\pellet-master;c:\documents\software\jena\apache-jena-2.13.0\bat;
set JENA_HOME="d:\apps\apache-jena-2.10.1\"

perl argify.pl %*
