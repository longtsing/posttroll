# Sphinx 文档构建器的配置文件。
#
# 有关内置配置值的完整列表，请参阅文档：
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- 项目信息 -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
from posttroll.version import version

project = "Posttroll"
copyright = "2012, Pytroll Crew"
author = "Pytroll Crew"
release = version
language = "zh_CN"

# -- 常规配置 ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["sphinx.ext.napoleon", "sphinx.ext.autodoc"]
autodoc_mock_imports = ["pyzmq"]

templates_path = ["_templates"]
exclude_patterns = []



# -- HTML 输出选项 -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "sphinx_rtd_theme"
html_static_path = ["_static"]
