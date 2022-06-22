@echo off

set ZipFile=PixelConv.zip

if exist %ZipFile% del %ZipFile%

::zip %ZipFile% PixelConv.32.exe PixelConv.64.exe Readme.txt
7z a -tzip %ZipFile% PixelConv.32.exe PixelConv.64.exe Readme.txt

