@echo off
setlocal

rem If you don't add path for msys2 into %PATH%, enable following line.
rem set PATH=c:\msys64\usr\bin;%PATH%

rem https://gist.github.com/carlos-algms/57bb219ac07434a0f07ae1c28074b70e
rem https://github.com/microsoft/vscode/issues/4651#issue-143290321

if "%1" equ "rev-parse" goto rev_parse
git %*
goto :eof
:rev_parse
for /f %%1 in ('git %*') do cygpath -w %%1
