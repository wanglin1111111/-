# Low-Cost Search 快速搜索脚本套件

## 项目定位
本项目旨在为个人桌面环境下提供一套轻量、开箱即用的本地知识/网页快速搜索体验，支持通过自然语言问题，调用本地搜索服务获知答案。

## 适用场景
- 桌面端一键搜索知识/网页内容
- 搭配自建 prompt knowledge base 实现本地化检索
- 低算力环境使用（如低配置 PC 等）

## 能力说明
- Windows 批处理命令一键搜索
- 检查、自动启动本地搜索服务
- 查询示例丰富，适合中文、英文用户

## 目录结构与文件说明
- `quick_search.bat`：用户入口批处理搜索脚本
- `start_server.bat`：本地搜索服务快速启动脚本
- `start_server_silent.vbs`：以静默模式启动服务的 VBS 脚本
- `test_search.bat`：搜索功能官方用例测试脚本
- `SKILL.md`：能力详细说明

## 依赖环境
- Windows 系统（建议 Windows 10 及以上）
- Python 3（已在 AutoClaw 软件包内自带，无需单独安��）
- low-cost-search 技能包

## 安装与使用
1. 下载或克隆本仓库文件到任意可执行目录下。
2. 双击或命令行运行 `quick_search.bat "你的问题"`。
3. 首次运行会自动启动服务，根据提示等待数秒。

## 启动与服务说明
- 本系统自动检测本地 18765 端口的搜索服务，未启动时会自动通过 `start_server.bat` 补全。
- 服务脚本假定 Python 位于 AutoClaw 默认安装目录（可在 `start_server.bat` 中手动更改路径）。
- VBS 脚本用于任务计划、静默启动场景。

## 测试样例
运行 `test_search.bat` 自动验证服务状态和 out-of-box 检索能力.
