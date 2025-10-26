# PostTroll 中文文档构建测试指南

## 快速测试

### 方法 1：使用 make.bat（推荐）

在 `doc_zh` 目录下运行：

```cmd
cd f:\Projects\posttroll\doc_zh
make.bat html
```

### 方法 2：直接使用 sphinx-build

```cmd
cd f:\Projects\posttroll\doc_zh
sphinx-build -b html source build\html
```

## 预期结果

构建成功后，您会看到：
- 在 `doc_zh/build/html/` 目录下生成完整的 HTML 文档
- 主页面为 `doc_zh/build/html/index.html`
- 文档界面为中文，包括导航、搜索等元素

## 与原 doc 目录的对比

| 项目 | doc (英文) | doc_zh (中文) |
|------|-----------|--------------|
| 语言设置 | 无（默认英文） | `language = "zh_CN"` |
| 文档内容 | 英文 | 中文翻译 |
| 目录结构 | 完全相同 | 完全相同 |
| 构建命令 | 相同 | 相同 |
| 输出目录 | `doc/build/` | `doc_zh/build/` |

## 功能完整性

doc_zh 完全可以替代 doc 用于中文文档构建，包括：

✅ Sphinx 配置文件（conf.py）- 已翻译注释并添加中文语言配置
✅ 主文档（index.rst）- 完整翻译
✅ 构建脚本（make.bat, Makefile）- 已翻译帮助信息
✅ 依赖文件（requirements.txt）- 保持不变
✅ 静态文件目录（_static）- 已创建
✅ 模板目录（_templates）- 已创建
✅ README 说明文档 - 已添加

## 注意事项

1. 确保已安装 sphinx 和 sphinx-rtd-theme：
   ```cmd
   pip install sphinx sphinx-rtd-theme
   ```

2. 确保 posttroll 包已安装或在 Python 路径中：
   ```cmd
   pip install -e f:\Projects\posttroll
   ```

3. 如果遇到编码问题，确保：
   - 文件保存为 UTF-8 编码
   - 终端支持 UTF-8 字符显示

## 清理构建文件

```cmd
cd f:\Projects\posttroll\doc_zh
make.bat clean
```
