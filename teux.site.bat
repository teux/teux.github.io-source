@echo off
set DITA_DIR=%DITA_HOME%

REM Set environment variables
set ANT_OPTS=-Xmx512m %ANT_OPTS%
set ANT_OPTS=%ANT_OPTS% -Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl
set PATH=%DITA_DIR%tools\ant\bin;%PATH%
set CLASSPATH=%DITA_DIR%lib;%DITA_DIR%lib\dost.jar;%DITA_DIR%lib\commons-codec-1.4.jar;%DITA_DIR%lib\resolver.jar;%DITA_DIR%lib\icu4j.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\xercesImpl.jar;%DITA_DIR%lib\xml-apis.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\saxon\saxon9.jar;%DITA_DIR%lib\saxon\saxon9-dom.jar;%CLASSPATH%

SET WD=%CD%

REM !!!Change directory to DITA_HOME becouse bug in merge module
pushd %DITA_HOME%

IF defined SERNA_XML_SRCFILENAME (
	ant -f %WD%\build.xml teux.file -Dtopic.file=%SERNA_XML_SRCFILENAME%
) ELSE ant -f %WD%\build.xml teux.site
popd