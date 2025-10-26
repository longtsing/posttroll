# PostTroll 中文文档导航

欢迎使用 PostTroll 中文文档！

## 📚 文档索引

### 🚀 快速开始
1. **[README.md](README.md)** - 开始这里！包含安装、构建和使用说明

### 🔧 构建工具
- **make.bat** - Windows 构建脚本
- **Makefile** - Linux/Mac 构建脚本
- **[build_and_view.bat](build_and_view.bat)** - Windows 一键构建和预览
- **[build_and_view.sh](build_and_view.sh)** - Linux/Mac 一键构建和预览

### 📖 说明文档
- **[BUILD_TEST.md](BUILD_TEST.md)** - 构建测试指南，包含快速测试步骤
- **[TRANSLATION_NOTES.md](TRANSLATION_NOTES.md)** - 详细的翻译对照表
- **[COMPARISON.md](COMPARISON.md)** - doc_zh 与 doc 的完整对比
- **[COMPLETED.md](COMPLETED.md)** - 项目完成总结

### 📝 源文件
- **source/index.rst** - 主文档（中文翻译）
- **source/conf.py** - Sphinx 配置文件
- **requirements.txt** - Python 依赖

## 🎯 使用流程

```
1. 阅读 README.md
   ↓
2. 安装依赖：pip install -r requirements.txt
   ↓
3. 构建文档：make.bat html 或 ./build_and_view.bat
   ↓
4. 查看文档：打开 build/html/index.html
```

## 💡 常见任务

### 构建 HTML 文档
```cmd
make.bat html
```

### 快速构建并预览
```cmd
build_and_view.bat
```

### 清理构建文件
```cmd
make.bat clean
```

### 检查链接
```cmd
make.bat linkcheck
```

## 🆘 需要帮助？

- **使用问题**：查看 [README.md](README.md)
- **构建问题**：查看 [BUILD_TEST.md](BUILD_TEST.md)
- **翻译疑问**：查看 [TRANSLATION_NOTES.md](TRANSLATION_NOTES.md)
- **对比原文档**：查看 [COMPARISON.md](COMPARISON.md)

## 📂 目录结构

```
doc_zh/
├── README.md                    ← 从这里开始
├── BUILD_TEST.md                ← 构建测试
├── TRANSLATION_NOTES.md         ← 翻译说明
├── COMPARISON.md                ← 完整对比
├── COMPLETED.md                 ← 完成总结
├── INDEX.md                     ← 本文件（导航）
├── make.bat / Makefile          ← 构建脚本
├── build_and_view.*             ← 快速构建工具
├── requirements.txt             ← 依赖文件
└── source/
    ├── conf.py                  ← Sphinx 配置
    ├── index.rst                ← 主文档
    ├── _static/                 ← 静态文件
    └── _templates/              ← 模板文件
```

## ✨ 特色功能

- ✅ **完全中文化**：界面和内容全部中文
- ✅ **独立使用**：无需依赖原 doc 目录
- ✅ **功能完整**：支持所有 Sphinx 构建格式
- ✅ **易于维护**：清晰的结构和详细的说明
- ✅ **快速构建**：提供一键构建脚本

## 🔗 相关链接

- **PostTroll 项目**：https://github.com/pytroll/posttroll
- **Pytroll 官网**：http://www.pytroll.org
- **Sphinx 文档**：https://www.sphinx-doc.org/

---

**提示**：如果是第一次使用，请从 [README.md](README.md) 开始阅读！
