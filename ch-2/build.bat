echo off

ml64 /nologo /c /Zi /Cp %1.asm

cl /nologo /02 /Zi /utf-8 /EHa /Fe%1.exe c.cpp %1.obj


