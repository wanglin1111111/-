# Low-Cost Search Skill 能力说明

## 能力清单
- 快速本地检索：通过 `quick_search.bat` 实现自然语言问题、本地知识库问答或网页摘要搜索。
- 服务守护：自动检测和管理本地 Python 检索服务进程，端口冲突自动杀死并重启。
- 一键测试：提供 `test_search.bat` 简易自动化用例。

## 主要文件接口
- `quick_search.bat`：搜索主脚本，负责参数传递、服务检测及 CURL 调用。
- `start_server.bat`：服务进程启动，校验依赖项。
- `start_server_silent.vbs`：用于静默方式启动搜索服务。
- `test_search.bat`：测试脚本，输出服务心跳和检索结果。

## 接入方式
- 将知识库或网页索引搭建于 search_server.py 所需数据目录下。
- 提供自然语言问题，脚本自动对接 REST API。

## 进阶用法
- 配合任务调度器实现定时唤醒。
- 脚本可集成进外部自动化流程.
