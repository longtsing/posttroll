@ECHO OFF

REM Sphinx 文档构建命令文件

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set BUILDDIR=build
set ALLSPHINXOPTS=-d %BUILDDIR%/doctrees %SPHINXOPTS% source
if NOT "%PAPER%" == "" (
	set ALLSPHINXOPTS=-D latex_paper_size=%PAPER% %ALLSPHINXOPTS%
)

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.请使用 `make ^<target^>` 其中 ^<target^> 是下列之一
	echo.  html       生成独立的 HTML 文件
	echo.  dirhtml    生成以 index.html 命名的 HTML 文件目录
	echo.  singlehtml 生成单个大型 HTML 文件
	echo.  pickle     生成 pickle 文件
	echo.  json       生成 JSON 文件
	echo.  htmlhelp   生成 HTML 文件和 HTML 帮助项目
	echo.  qthelp     生成 HTML 文件和 qthelp 项目
	echo.  devhelp    生成 HTML 文件和 Devhelp 项目
	echo.  epub       生成 epub 文件
	echo.  latex      生成 LaTeX 文件，可设置 PAPER=a4 或 PAPER=letter
	echo.  text       生成文本文件
	echo.  man        生成手册页
	echo.  changes    生成所有更改/添加/弃用项目的概览
	echo.  linkcheck  检查所有外部链接的完整性
	echo.  doctest    运行文档中嵌入的所有 doctest（如果启用）
	goto end
)

if "%1" == "clean" (
	for /d %%i in (%BUILDDIR%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR%\*
	goto end
)

if "%1" == "html" (
	%SPHINXBUILD% -b html %ALLSPHINXOPTS% %BUILDDIR%/html
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成。HTML 页面位于 %BUILDDIR%/html。
	goto end
)

if "%1" == "dirhtml" (
	%SPHINXBUILD% -b dirhtml %ALLSPHINXOPTS% %BUILDDIR%/dirhtml
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成。HTML 页面位于 %BUILDDIR%/dirhtml。
	goto end
)

if "%1" == "singlehtml" (
	%SPHINXBUILD% -b singlehtml %ALLSPHINXOPTS% %BUILDDIR%/singlehtml
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成。HTML 页面位于 %BUILDDIR%/singlehtml。
	goto end
)

if "%1" == "pickle" (
	%SPHINXBUILD% -b pickle %ALLSPHINXOPTS% %BUILDDIR%/pickle
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成，现在您可以处理 %BUILDDIR%/pickle 中的 pickle 文件。
	goto end
)

if "%1" == "json" (
	%SPHINXBUILD% -b json %ALLSPHINXOPTS% %BUILDDIR%/json
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成，现在您可以处理 %BUILDDIR%/json 中的 JSON 文件。
	goto end
)

if "%1" == "htmlhelp" (
	%SPHINXBUILD% -b htmlhelp %ALLSPHINXOPTS% %BUILDDIR%/htmlhelp
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成，现在您可以运行 HTML Help Workshop 与
	echo.%BUILDDIR%/htmlhelp 中的项目文件。
	goto end
)

if "%1" == "qthelp" (
	%SPHINXBUILD% -b qthelp %ALLSPHINXOPTS% %BUILDDIR%/qthelp
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成，现在您可以运行 qcollectiongenerator 与
	echo.%BUILDDIR%/qthelp 中的 .qhcp 项目文件，例如：
	echo.^> qcollectiongenerator %BUILDDIR%\qthelp\PostTroll.qhcp
	echo.要查看帮助文件：
	echo.^> assistant -collectionFile %BUILDDIR%\qthelp\PostTroll.ghc
	goto end
)

if "%1" == "devhelp" (
	%SPHINXBUILD% -b devhelp %ALLSPHINXOPTS% %BUILDDIR%/devhelp
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成。
	goto end
)

if "%1" == "epub" (
	%SPHINXBUILD% -b epub %ALLSPHINXOPTS% %BUILDDIR%/epub
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成。epub 文件位于 %BUILDDIR%/epub。
	goto end
)

if "%1" == "latex" (
	%SPHINXBUILD% -b latex %ALLSPHINXOPTS% %BUILDDIR%/latex
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成，LaTeX 文件位于 %BUILDDIR%/latex。
	goto end
)

if "%1" == "text" (
	%SPHINXBUILD% -b text %ALLSPHINXOPTS% %BUILDDIR%/text
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成。文本文件位于 %BUILDDIR%/text。
	goto end
)

if "%1" == "man" (
	%SPHINXBUILD% -b man %ALLSPHINXOPTS% %BUILDDIR%/man
	if errorlevel 1 exit /b 1
	echo.
	echo.构建完成。手册页位于 %BUILDDIR%/man。
	goto end
)

if "%1" == "changes" (
	%SPHINXBUILD% -b changes %ALLSPHINXOPTS% %BUILDDIR%/changes
	if errorlevel 1 exit /b 1
	echo.
	echo.概览文件位于 %BUILDDIR%/changes。
	goto end
)

if "%1" == "linkcheck" (
	%SPHINXBUILD% -b linkcheck %ALLSPHINXOPTS% %BUILDDIR%/linkcheck
	if errorlevel 1 exit /b 1
	echo.
	echo.链接检查完成，查看 %BUILDDIR%/linkcheck 中的输出。
	goto end
)

if "%1" == "doctest" (
	%SPHINXBUILD% -b doctest %ALLSPHINXOPTS% %BUILDDIR%/doctest
	if errorlevel 1 exit /b 1
	echo.
	echo.测试完成，查看 %BUILDDIR%/doctest/output.txt 中的结果。
	goto end
)

:end
