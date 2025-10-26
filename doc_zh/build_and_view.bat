@echo off
REM PostTroll 中文文档快速构建脚本
REM 
REM 使用方法：
REM   build_and_view.bat        - 构建并在浏览器中打开文档
REM   build_and_view.bat clean  - 清理构建文件

echo ========================================
echo PostTroll 中文文档构建工具
echo ========================================
echo.

if "%1"=="clean" (
    echo 清理构建文件...
    call make.bat clean
    echo 清理完成！
    goto end
)

echo 检查依赖...
python -c "import sphinx" 2>nul
if errorlevel 1 (
    echo [错误] 未找到 Sphinx，请先安装：
    echo   pip install -r requirements.txt
    goto end
)

echo 依赖检查通过！
echo.

echo 开始构建 HTML 文档...
call make.bat html

if errorlevel 1 (
    echo.
    echo [错误] 文档构建失败！
    echo 请检查错误信息。
    goto end
)

echo.
echo ========================================
echo 构建成功！
echo ========================================
echo.
echo 文档位置：build\html\index.html
echo.

REM 询问是否打开浏览器
set /p OPEN="是否在浏览器中打开文档？(Y/N): "
if /i "%OPEN%"=="Y" (
    echo 正在打开浏览器...
    start build\html\index.html
)

:end
echo.
pause
