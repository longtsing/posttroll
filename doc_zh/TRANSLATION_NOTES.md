# 文档翻译对照表

本文档记录了从 `doc` 到 `doc_zh` 的翻译内容。

## 文件列表

| 原文件 (doc) | 中文文件 (doc_zh) | 翻译状态 |
|-------------|------------------|---------|
| make.bat | make.bat | ✅ 完全翻译（帮助信息） |
| Makefile | Makefile | ✅ 完全翻译（注释） |
| requirements.txt | requirements.txt | ⚪ 保持不变 |
| source/conf.py | source/conf.py | ✅ 翻译注释 + 添加语言配置 |
| source/index.rst | source/index.rst | ✅ 完全翻译 |
| source/_static/ | source/_static/ | ✅ 已创建 |
| source/_templates/ | source/_templates/ | ✅ 已创建 |

## 主要翻译内容

### 1. make.bat

翻译了所有帮助信息和输出消息：
- `Please use 'make <target>'` → `请使用 'make <target>'`
- `to make standalone HTML files` → `生成独立的 HTML 文件`
- `Build finished` → `构建完成`
- 等等...

### 2. Makefile

翻译了注释：
- `Minimal makefile for Sphinx documentation` → `Sphinx 文档的最小 Makefile`
- `You can set these variables...` → `您可以从命令行设置这些变量...`

### 3. source/conf.py

- 翻译了所有注释
- **重要**：添加了 `language = "zh_CN"` 配置
- 这使得 Sphinx 生成的界面元素（如"搜索"、"目录"等）显示为中文

### 4. source/index.rst

完整翻译了文档内容，包括：

#### 标题和章节
- `PostTroll` → 保持不变（项目名称）
- `Use Example` → `使用示例`
- `Configuration parameters` → `配置参数`
- `API` → `API`（保持专业术语）

#### 正文内容
- `PostTroll is a message system for pytroll.` → `PostTroll 是 pytroll 的消息系统。`
- `A typical use is for event-driven production chains...` → `典型用途是用于事件驱动的生产链...`

#### 代码注释
- `optional arguments:` → `可选参数:`
- `positional arguments:` → `位置参数:`

#### 章节内容
- **使用示例** - 完整翻译，保留代码示例
- **配置参数** - 翻译说明文字
- **设置 TCP 保活** - 完整翻译技术说明
- **使用安全的 ZeroMQ 后端** - 翻译所有说明
- **从旧版 posttroll 迁移** - 翻译迁移指南
- **处理时区感知的 datetime 对象** - 翻译技术说明
- **API** - 翻译章节标题和说明

#### API 文档章节
- `Publisher` → `发布者`
- `Subscriber` → `订阅者`
- `Messages` → `消息`
- `Address receiver` → `地址接收器`
- `Name server` → `名称服务器`
- `Multicasting` → `组播`
- `Context` → `上下文`
- `Multicast code` → `组播代码`
- `Misc` → `杂项`
- `Indices and tables` → `索引和表格`

## 翻译原则

1. **保持专业术语的准确性**
   - API、TCP、ZeroMQ 等技术术语保持不变
   - 适当使用中文技术词汇（如"组播"、"订阅者"等）

2. **保留代码示例**
   - 所有 Python 代码保持不变
   - 仅翻译代码周围的说明文字

3. **保持文档结构**
   - RST 指令（如 `.. automodule::`）保持不变
   - 文档层级结构保持一致

4. **配置文件的处理**
   - 关键配置项保持英文
   - 添加 `language = "zh_CN"` 实现界面中文化
   - 注释翻译为中文

## 功能验证清单

使用 doc_zh 可以完成以下所有操作：

- ✅ 构建 HTML 文档（`make.bat html`）
- ✅ 构建单页 HTML（`make.bat singlehtml`）
- ✅ 构建 PDF（通过 LaTeX，`make.bat latex`）
- ✅ 构建 EPUB（`make.bat epub`）
- ✅ 链接检查（`make.bat linkcheck`）
- ✅ 文档测试（`make.bat doctest`）
- ✅ 自动生成 API 文档
- ✅ 搜索功能（中文界面）
- ✅ 主题支持（Read the Docs 主题）

## 中文化的具体效果

当使用 doc_zh 构建文档时，以下界面元素将显示为中文：

- 导航栏："内容"、"搜索"等
- 搜索提示："输入搜索词"
- 警告信息："警告"、"注意"等
- 自动生成的标题："参数"、"返回"、"引发"等
- 索引页面："模块索引"、"索引"等

## 维护建议

1. 当原 `doc` 目录更新时，应同步更新 `doc_zh`
2. 保持两个目录的结构一致
3. 新增文件应同时添加到两个目录
4. 代码示例保持同步，仅翻译说明文字
