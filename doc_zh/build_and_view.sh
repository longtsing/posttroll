#!/bin/bash
# PostTroll 中文文档快速构建脚本
# 
# 使用方法：
#   ./build_and_view.sh        - 构建并在浏览器中打开文档
#   ./build_and_view.sh clean  - 清理构建文件

echo "========================================"
echo "PostTroll 中文文档构建工具"
echo "========================================"
echo ""

if [ "$1" = "clean" ]; then
    echo "清理构建文件..."
    make clean
    echo "清理完成！"
    exit 0
fi

echo "检查依赖..."
python3 -c "import sphinx" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "[错误] 未找到 Sphinx，请先安装："
    echo "  pip install -r requirements.txt"
    exit 1
fi

echo "依赖检查通过！"
echo ""

echo "开始构建 HTML 文档..."
make html

if [ $? -ne 0 ]; then
    echo ""
    echo "[错误] 文档构建失败！"
    echo "请检查错误信息。"
    exit 1
fi

echo ""
echo "========================================"
echo "构建成功！"
echo "========================================"
echo ""
echo "文档位置：build/html/index.html"
echo ""

# 询问是否打开浏览器
read -p "是否在浏览器中打开文档？(Y/N): " OPEN
if [ "$OPEN" = "Y" ] || [ "$OPEN" = "y" ]; then
    echo "正在打开浏览器..."
    # 尝试不同的浏览器命令
    if command -v xdg-open > /dev/null; then
        xdg-open build/html/index.html
    elif command -v open > /dev/null; then
        open build/html/index.html
    else
        echo "无法自动打开浏览器，请手动打开：build/html/index.html"
    fi
fi

echo ""
