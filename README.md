# WNtight
Great free dictionary! WordNet simple command line interface for Linux users, no Tlc/Tk hassles
We, as have many, thought it would be a great idea to have the Princeton University WordNet application available on a Linux
to use as a free dictionary. As is common if you google the concept, installation of the windowed browser version of WordNet
available at their website https://wordnet.princeton.edu/ is a real pain in the neck since they use Tcl/Tk and that forces
you into fighting with package updates and dependencies to try to make Tcl/Tk available and function with their code 
last version of which was 2006. 

We looked back to the 1997 source when they were just beginning to use Tcl/Tk and Autotools Automake etc and managed to
extricate a simple makefile with no recursion or Tcl/Tk involved. You just follow the installation instructions we provide
in the pdf Manual, basically create a working directory in your home directory and make the executable there. Then you make
a directory in /usr/local/ named WNtight (a tight version of WordNet, if the name is annoying to you, you need to modify 
the wn.h include file, where the path is hardwired to find the dictionary files in /usr/local/WNtight/dict. It would be
advisable to get it working before modifying it. 

You required a C compiler (I used gcc-7). You may have to obtain build-essential package to permit compiling and building
on recent Linux installations (like our Ubuntu 18.04.4). That is discussed in the pdf manual available here. Not much
more is required, just gcc, make, libc, etc. so you have the c library for your installation and the headers to use that
code in the make. ar library should be on any Linux system.

Just copy the wn executable, the libwn.a library code file (you construct
that in the make process earlier) and the dictionary flles from /dict (place them in the new path /usr/local/WNtight/dict 
or they won't be found by /usr/local/WNtight/wn . 

You can test it from that new location (sudo in to copy the files in or su) with the ./wn "dog" -over. If that works then 
add the path to your PATH variable and you are good to go. Just open a terminal window anytime you want to check meaning
or spelling of a word and type wn "dog" -over (if you are only interested in the word "dog"). I give some hints how to
explore some of the linguistic information available also at the command line (in the pdf manual).

I will get the html documentation from WordNet Princeton up here soon, but you can get those by extraction from the
WordNet 3.0 download at Princeton in the meantime if you want to see more complex definitions of the functions.

The license from Princeton is available anytime with wn -l after installation and is:
WordNet Release 3.0

This software and database is being provided to you, the LICENSEE, by  
Princeton University under the following license.  By obtaining, using  
and/or copying this software and database, you agree that you have  
read, understood, and will comply with these terms and conditions.:  
  
Permission to use, copy, modify and distribute this software and  
database and its documentation for any purpose and without fee or  
royalty is hereby granted, provided that you agree to comply with  
the following copyright notice and statements, including the disclaimer,  
and that the same appear on ALL copies of the software, database and  
documentation, including modifications that you make for internal  
use or for distribution.  
  
WordNet 3.0 Copyright 2006 by Princeton University.  All rights reserved.  
  
THIS SOFTWARE AND DATABASE IS PROVIDED "AS IS" AND PRINCETON  
UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR  
IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PRINCETON  
UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES OF MERCHANT-  
ABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE  
OF THE LICENSED SOFTWARE, DATABASE OR DOCUMENTATION WILL NOT  
INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS, TRADEMARKS OR  
OTHER RIGHTS.  
  
The name of Princeton University or Princeton may not be used in  
advertising or publicity pertaining to distribution of the software  
and/or database.  Title to copyright in this software, database and  
any associated documentation shall at all times remain with  
Princeton University and LICENSEE agrees to preserve same.  


