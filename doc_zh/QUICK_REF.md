# PostTroll 中文文档 - 快速参考

## 📦 一句话总结
`doc_zh` 是 `doc` 的完整中文版本，可以完全替代 `doc` 用于中文文档构建。

## ⚡ 3 步快速开始

```cmd
# 1. 安装依赖
cd f:\Projects\posttroll\doc_zh
pip install -r requirements.txt

# 2. 构建文档
make.bat html

# 3. 查看文档
start build\html\index.html
```

## 📊 核心文件一览

| 文件 | 用途 | 状态 |
|------|------|------|
| `source/index.rst` | 主文档 | ✅ 完整翻译 |
| `source/conf.py` | Sphinx 配置 | ✅ 中文化 |
| `make.bat` | 构建脚本 | ✅ 已翻译 |
| `Makefile` | 构建脚本 | ✅ 已翻译 |
| `requirements.txt` | 依赖 | ⚪ 不变 |

## 🎯 常用命令

```cmd
make.bat html        # 构建 HTML
make.bat clean       # 清理
make.bat linkcheck   # 检查链接
make.bat singlehtml  # 单页 HTML
make.bat latex       # LaTeX/PDF
```

## 🔑 关键配置

在 `source/conf.py` 中：
```python
language = "zh_CN"  # 启用中文界面
```

## 📁 文件数量

- **核心文件**: 5 个（已翻译）
- **说明文档**: 6 个（新增）
- **工具脚本**: 2 个（新增）
- **总计**: 15 个文件

## ✨ 特色

- ✅ 界面完全中文化
- ✅ 文档内容全翻译
- ✅ 结构与 doc 一致
- ✅ 功能完全对等
- ✅ 可独立使用

## 🆘 快速帮助

| 问题 | 查看文档 |
|------|---------|
| 如何使用？ | `README.md` |
| 如何测试？ | `BUILD_TEST.md` |
| 翻译对照？ | `TRANSLATION_NOTES.md` |
| 与 doc 对比？ | `COMPARISON.md` |
| 完成情况？ | `COMPLETED.md` |
| 文档导航？ | `INDEX.md` |

## 🎓 文档结构

```
doc_zh/
├── 📄 核心文件
│   ├── make.bat, Makefile
│   ├── requirements.txt
│   └── source/ (conf.py, index.rst)
│
├── 📖 说明文档
│   ├── README.md
│   ├── BUILD_TEST.md
│   ├── TRANSLATION_NOTES.md
│   ├── COMPARISON.md
│   ├── COMPLETED.md
│   └── INDEX.md
│
└── 🔧 工具脚本
    ├── build_and_view.bat
    └── build_and_view.sh
```

## 💡 一键操作

**Windows:**
```cmd
build_and_view.bat
```

**Linux/Mac:**
```bash
./build_and_view.sh
```

## ✅ 验证清单

- [ ] Python 3.6+ 已安装
- [ ] Sphinx 已安装
- [ ] sphinx-rtd-theme 已安装
- [ ] posttroll 包可导入

## 🔗 相关资源

- **GitHub**: https://github.com/pytroll/posttroll
- **Pytroll**: http://www.pytroll.org
- **Sphinx**: https://www.sphinx-doc.org/

---

**提示**: 第一次使用？直接运行 `build_and_view.bat`！
