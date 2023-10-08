# Python C Extensions Example

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/shengchenyang/PyCExtensions/python-package.yml)
![GitHub](https://img.shields.io/github/license/shengchenyang/PyCExtensions)
![python version](https://img.shields.io/badge/python-3.8_%7C_3.9_%7C_3.10_%7C_3.11_%7C_3.12-brightgreen)
![codecov](https://codecov.io/gh/shengchenyang/PyCExtensions/branch/main/graph/badge.svg?token=95d2381c-c4fa-4503-9116-b720e91b9a1f)

> 用于介绍一个 `python C extension` 的示例，用于熟悉其中流程，并了解其与 `poetry c extension` 中的区别和各自优势。
>

## 前言

**编写日期：** *2023/03/23*

本项目就是使用 `setuptools` 来实现 `python c extension` 的示例，并通过 `cibuildwheel`  来进行 `linux`，`windows` 和 `macos` 全平台打包和发包的演示。

据 `2022` 年的统计可知，目前比较流行的 `Python` 包管理工具为 `setuptools`，`poetry` 和 `conda`，当然还有 `flit` 等其它工具。我比较常用 `setuptools` 和 `poetry`，`poetry` 在易用性上比较有优势，其理念也比较符合 `python` 未来的趋势，其使用 `pyproject.toml` 文件，以一个文件来统一管理项目的所有信息，从而提高项目的可维护性和可读性。但是很多工具的官方文档中都或多或少不太建议优先在 `pyproject.toml` 中配置，还有在含有 `c extension` 的情况下 `poetry` 和其它第三方包管理器就无法快速且优雅地实现，比如 `poetry` 官方文档现在还没有 `python c extension` 的示例，不过在其 `ISSUES` 中提到会尽快支持。

所以，本项目就以 `setuptools` 来实现标准的包管理的一个示例。

## 前提准备

`windows`，`linux` 或 `macos` 上配置 `make` 工具。

## 项目说明

本项目就是一个使用 `setuptools` 实现的 `Python C Extensions` 的示例，调用了 `c` 中的 `fprintf` 方法：将格式化的数据输出到指定的文件中。具体如何使用此库，在测试文件中已经列举了详细的使用方法。可以通过 `make test` 测试，或者手动安装本库后运行示例中的方法。

也用于介绍项目工程化的一个简单示例，一些 `github workflow`，代码检测，格式化和测试覆盖率等工具的使用。

## 运行说明

- 直接使用 `make build_dist` 即可运行打包，安装 `wheel` 并跑通测试。
- 当然也可以单独使用指令，比如：
  - **make clean:** 卸载本库，并清理测试文件，打包文件等。
  - **make test:** 跑测试。
  - 其它命令，比如 `make install`, `make build` 不再说明。

