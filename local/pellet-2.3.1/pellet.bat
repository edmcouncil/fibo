@echo off

set java=java

if exist "%JAVA_HOME%\bin\java.exe" set java="%JAVA_HOME%\bin\java"

if "%pellet_java_args%"=="" set pellet_java_args=-Xmx512m

%java% %pellet_java_args% -jar lib\pellet-cli.jar  %*