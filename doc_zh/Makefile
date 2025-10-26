# Sphinx 文档的最小 Makefile
#

# 您可以从命令行设置这些变量，也可以
# 为前两个变量从环境中设置。
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# 首先放置它，以便不带参数的 "make" 等同于 "make help"。
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# 捕获所有目标：使用新的
# "make mode" 选项将所有未知目标路由到 Sphinx。$(O) 用作 $(SPHINXOPTS) 的快捷方式。
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
