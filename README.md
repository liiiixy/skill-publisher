# Skill Generator & Publisher — Claude Code Skill 生成器与发布器

一个 **Claude Code Skill**，具备两大核心能力：

1. **🧠 Skill 生成器**：用户在多轮对话中完成任务后，自动回溯对话、提炼流程、生成可复用的 Skill 文件
2. **📦 Skill 发布器**：安全检查、打包、一键推送到 GitHub

## ✨ 核心场景

```
用户和 Claude 完成了某个任务（比如数据分析、网页爬取、邮件处理...）
↓
用户输入 /publish 或说 "把这个能力打包成 skill"
↓
Claude 自动：分析对话 → 提炼流程 → 生成 Skill .md 文件 → 安全检查 → 推送 GitHub
↓
其他人 git clone + ./install.sh 就能复用这个能力
```

## 📦 安装

### 方式 1：一键安装（推荐）

```bash
git clone https://github.com/liiiixy/skill-publisher.git
cd skill-publisher
./install.sh /path/to/your/project
```

### 方式 2：手动安装

```bash
git clone https://github.com/liiiixy/skill-publisher.git

# 复制 Skill 文件
mkdir -p /path/to/your/project/.claude/skills
cp skill-publisher/.claude/skills/skill-publisher.md /path/to/your/project/.claude/skills/

# 复制斜杠命令（可选，启用 /publish 快捷键）
mkdir -p /path/to/your/project/.claude/commands
cp skill-publisher/.claude/commands/publish.md /path/to/your/project/.claude/commands/
```

## 🚀 使用

在 Claude Code 中：

| 方式 | 说明 |
|------|------|
| `/publish` | 斜杠命令快捷触发 |
| `"把这个打包成 skill"` | 从当前对话生成新 Skill |
| `"发布 skill"` / `"push to GitHub"` | 打包并推送到 GitHub |
| `"检查敏感信息"` | 仅安全扫描 |
| `"帮我写个 README"` | 仅生成文档 |

## 🧠 Skill 生成器（G1-G6）

| 步骤 | 说明 |
|------|------|
| G1. 分析对话 | 回溯对话历史，提炼任务流程、工具、交互点 |
| G2. 设计架构 | 根据复杂度决定单 skill 还是多 skill |
| G3. 生成文件 | 按标准模板生成 `.claude/skills/*.md` |
| G4. 处理代码 | 通用化配套 Python 脚本，生成 requirements.txt |
| G5. 用户审核 | 展示完整内容，用户确认或修改 |
| G6. 验证 | 确认文件可用，给出测试建议 |

## 📦 Skill 发布器（P1-P7）

| 步骤 | 说明 |
|------|------|
| P1. 扫描项目 | 自动识别需要打包的文件，排除敏感/临时文件 |
| P2. 安全检查 | 扫描密码、API Key、硬编码邮箱、绝对路径等 |
| P3. 生成 README | 自动生成包含安装方法、使用说明的 README |
| P4. 生成 install.sh | 创建一键安装脚本 |
| P5. 生成 .gitignore | 确保敏感文件不被提交 |
| P6. 推送 GitHub | 支持 GitHub CLI / MCP / 手动 git |
| P7. 验证 | 确认推送成功，给出分享链接 |

## 📁 项目结构

```
skill-publisher/
├── .claude/
│   ├── skills/
│   │   └── skill-publisher.md    # Skill 定义文件
│   └── commands/
│       └── publish.md            # /publish 斜杠命令
├── install.sh                    # 一键安装脚本
└── README.md
```

## 🔒 安全检查项

- 邮箱密码 / App Password
- API Key（`SG.` / `re_` / `sk_` / `ghp_` 开头）
- 硬编码邮箱地址
- 绝对路径（`/Users/xxx/...`）
- token / secret / credential 赋值

## 📄 License

MIT
