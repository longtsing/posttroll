# PostTroll 中文文档

这是 PostTroll 项目的中文文档目录。

## 目录结构

```
doc_zh/
├── make.bat              # Windows 构建脚本
├── Makefile             # Linux/Mac 构建脚本
├── requirements.txt     # 文档构建依赖
└── source/              # 文档源文件
    ├── conf.py          # Sphinx 配置文件（已配置中文）
    ├── index.rst        # 主文档文件（中文翻译）
    ├── _static/         # 静态文件目录
    └── _templates/      # 模板文件目录
```

## 构建文档

### 1. 安装依赖

首先安装文档构建所需的依赖：

```bash
pip install -r requirements.txt
```

或者安装 posttroll 包本身（包含所有依赖）：

```bash
pip install -e ..
```

### 2. 构建 HTML 文档

**在 Windows 上：**

```cmd
make.bat html
```

**在 Linux/Mac 上：**

```bash
make html
```

### 3. 查看文档

构建完成后，生成的 HTML 文档位于 `build/html/` 目录中。
用浏览器打开 `build/html/index.html` 即可查看中文文档。

## 其他构建选项

查看所有可用的构建选项：

**Windows:**
```cmd
make.bat help
```

**Linux/Mac:**
```bash
make help
```

常用选项包括：
- `html` - 生成 HTML 格式文档
- `singlehtml` - 生成单个 HTML 文件
- `latex` - 生成 LaTeX 格式文档
- `epub` - 生成 EPUB 电子书
- `linkcheck` - 检查文档中的链接
- `clean` - 清理构建文件

## 配置说明

`source/conf.py` 中的关键配置：

- `language = "zh_CN"` - 设置文档语言为简体中文
- `project = "Posttroll"` - 项目名称
- `html_theme = "sphinx_rtd_theme"` - 使用 Read the Docs 主题

## 文档维护

- 主文档文件：`source/index.rst`
- 文档使用 reStructuredText (RST) 格式编写
- API 文档通过 autodoc 扩展自动从源代码生成

## 注意事项

1. 确保已安装 `posttroll` 包，因为 `conf.py` 需要导入 `posttroll.version`
2. 如果遇到导入错误，请确保 posttroll 包在 Python 路径中
3. 构建过程会自动生成 API 文档（中文界面，但 API 描述仍为英文）
