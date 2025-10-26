# Doc_zh 与 Doc 目录完整对照

本文档说明 `doc_zh` (中文文档) 与 `doc` (英文文档) 目录的完整对应关系。

## 📁 目录结构对照

```
doc/                                doc_zh/
├── make.bat                        ├── make.bat              ✅ 已翻译
├── Makefile                        ├── Makefile              ✅ 已翻译
├── requirements.txt                ├── requirements.txt      ⚪ 相同
└── source/                         ├── README.md             ⭐ 新增（中文说明）
    ├── conf.py                     ├── BUILD_TEST.md         ⭐ 新增（构建测试指南）
    ├── index.rst                   ├── TRANSLATION_NOTES.md  ⭐ 新增（翻译说明）
    ├── _static/  (空目录)          ├── build_and_view.bat    ⭐ 新增（快速构建脚本）
    └── _templates/ (空目录)        ├── build_and_view.sh     ⭐ 新增（快速构建脚本）
                                    ├── .gitignore            ⭐ 新增
                                    └── source/
                                        ├── conf.py           ✅ 已翻译+配置
                                        ├── index.rst         ✅ 完整翻译
                                        ├── _static/          ✅ 已创建
                                        │   └── README.md     ⭐ 新增
                                        └── _templates/       ✅ 已创建
                                            └── README.md     ⭐ 新增
```

## 📊 文件状态说明

| 图标 | 含义 |
|-----|------|
| ✅ | 已从英文翻译为中文 |
| ⚪ | 保持与原文件相同 |
| ⭐ | 新增的辅助文件 |

## 🔄 核心文件对比

### 1. make.bat

**doc/make.bat** (英文)
```batch
echo.Please use `make ^<target^>` where ^<target^> is one of
echo.  html       to make standalone HTML files
```

**doc_zh/make.bat** (中文)
```batch
echo.请使用 `make ^<target^>` 其中 ^<target^> 是下列之一
echo.  html       生成独立的 HTML 文件
```

### 2. Makefile

**doc/Makefile** (英文)
```makefile
# Minimal makefile for Sphinx documentation
```

**doc_zh/Makefile** (中文)
```makefile
# Sphinx 文档的最小 Makefile
```

### 3. source/conf.py

**doc/source/conf.py** (英文配置)
```python
project = "Posttroll"
copyright = "2012, Pytroll Crew"
# 无 language 配置
```

**doc_zh/source/conf.py** (中文配置)
```python
project = "Posttroll"
copyright = "2012, Pytroll Crew"
language = "zh_CN"  # ⭐ 关键配置：启用中文界面
```

### 4. source/index.rst

**doc/source/index.rst** (英文文档，322行)
- 所有说明文字为英文
- 代码示例保持不变

**doc_zh/source/index.rst** (中文文档，322行)
- 所有说明文字翻译为中文
- 代码示例保持不变（仅注释翻译）
- 保持相同的结构和章节

## 🎯 功能完整性验证

### doc 可以做的：
- ✅ 构建 HTML 文档
- ✅ 构建其他格式（PDF、EPUB 等）
- ✅ 自动生成 API 文档
- ✅ 链接检查
- ✅ 文档测试

### doc_zh 可以做的：
- ✅ 构建 HTML 文档（中文界面）
- ✅ 构建其他格式（PDF、EPUB 等）
- ✅ 自动生成 API 文档（中文界面）
- ✅ 链接检查
- ✅ 文档测试
- ⭐ **额外功能**：快速构建脚本（build_and_view.*）

## 🌐 中文化范围

### 已中文化的内容：

1. **用户界面元素**
   - 导航栏
   - 搜索框
   - 按钮和链接
   - 警告和提示信息

2. **文档内容**
   - 所有章节标题
   - 所有段落文字
   - 使用说明
   - 配置参数说明
   - API 章节标题

3. **构建脚本**
   - 帮助信息
   - 错误提示
   - 成功消息

### 未中文化的内容（保持英文）：

1. **代码示例**
   - Python 代码
   - 命令行示例
   - 配置文件示例

2. **技术术语**
   - API、TCP、ZeroMQ 等
   - 函数名、类名、变量名

3. **URL 和链接**
   - 外部链接
   - 项目地址

4. **自动生成的 API 文档**
   - 由 autodoc 从源代码提取
   - 保持源代码语言（英文）

## 🚀 使用 doc_zh 的优势

### 对比原 doc 目录：

1. **完全独立**
   - 可以独立构建，不依赖 doc 目录
   - 有自己的 build 目录

2. **中文友好**
   - 界面元素全部中文化
   - 文档内容全部翻译
   - 更适合中文用户阅读

3. **增强功能**
   - 提供快速构建脚本
   - 包含详细的中文说明文档
   - 更容易维护和使用

4. **向后兼容**
   - 与 doc 目录结构完全一致
   - 可以互相替换
   - 构建命令相同

## 📝 维护建议

### 当 doc 更新时：

1. **文件更新**
   ```bash
   # 比较两个目录
   diff -r doc/ doc_zh/
   ```

2. **内容同步**
   - 将 doc 中的新内容翻译后更新到 doc_zh
   - 保持代码示例同步
   - 更新配置文件（如有变化）

3. **测试验证**
   ```bash
   cd doc_zh
   make clean
   make html
   ```

### 版本控制建议：

- 将 doc_zh 加入版本控制
- 在 doc_zh/.gitignore 中忽略 build/ 目录
- 提交时同时更新 doc 和 doc_zh

## 🔍 快速测试

### 验证 doc_zh 可以完全替代 doc：

```cmd
# 1. 进入 doc_zh 目录
cd f:\Projects\posttroll\doc_zh

# 2. 清理旧文件
make.bat clean

# 3. 构建 HTML 文档
make.bat html

# 4. 查看结果
start build\html\index.html
```

**预期结果**：
- ✅ 构建成功，无错误
- ✅ HTML 文件正常生成
- ✅ 界面显示为中文
- ✅ 内容为中文翻译
- ✅ API 文档正常生成
- ✅ 搜索功能正常

## 📧 问题反馈

如果在使用 doc_zh 时遇到问题：

1. 检查是否安装了所有依赖
2. 查看 BUILD_TEST.md 获取测试指南
3. 阅读 README.md 获取使用说明
4. 参考 TRANSLATION_NOTES.md 了解翻译细节
