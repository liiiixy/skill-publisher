# Skill Builder & Publisher — Claude Code Skill 构建与发布工具

两个独立的 **Claude Code Skill**，可单独使用也可串联：

1. **🧠 Skill Builder**（`/skill_builder`）：从对话中提炼流程、生成 Skill 文件、打包项目
2. **🚀 Skill Publisher**（`/skill_publisher`）：安全检查、推送到 GitHub

## ✨ 核心场景

```
你和 Claude 完成了某个任务（数据分析、网页爬取、邮件处理...）
↓
输入 /skill_builder
↓
Claude 自动：分析对话 → 提炼流程 → 生成 Skill .md → 打包（README + install.sh）
↓
你确认后，输入 /skill_publisher
↓
安全检查 → 推送 GitHub → 其他人 git clone 就能复用
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
mkdir -p /path/to/project/.claude/skills
cp skill-publisher/.claude/skills/*.md /path/to/project/.claude/skills/

# 复制斜杠命令
mkdir -p /path/to/project/.claude/commands
cp skill-publisher/.claude/commands/*.md /path/to/project/.claude/commands/
```

## 🚀 使用

| 命令 | 说明 |
|------|------|
| `/skill_builder` | 从当前对话生成 Skill + 打包项目 |
| `/skill_publisher` | 将已打包的 Skill 发布到 GitHub |
| `"把这个打包成 skill"` | 自然语言触发构建 |
| `"发布到 GitHub"` | 自然语言触发发布 |
| `"检查敏感信息"` | 仅安全扫描 |

### 典型流程

```
# 1. 完成某个任务后...
/skill_builder          ← 生成 Skill + 打包

# 2. 确认无误后...
/skill_publisher        ← 推送到 GitHub
```

## 🧠 Skill Builder 流程（9 步）

| 步骤 | 说明 |
|------|------|
| 1. 分析对话 | 回溯历史，提炼任务流程、工具、交互点 |
| 2. 设计架构 | 根据复杂度决定单 skill 还是多 skill |
| 3. 生成 Skill 文件 | 按标准模板生成 `.claude/skills/*.md` |
| 4. 处理配套代码 | 通用化 Python 脚本，生成 requirements.txt |
| 5. 用户审核 | 展示完整内容，用户确认或修改 |
| 6. 安全检查 | 扫描密码、API Key、硬编码邮箱、绝对路径 |
| 7. 生成项目文件 | README.md、install.sh、.gitignore |
| 8. 生成斜杠命令 | 创建 `/xxx` 快捷触发命令 |
| 9. 构建完成 | 给出测试建议，询问是否发布 |

## 🚀 Skill Publisher 流程（5 步）

| 步骤 | 说明 |
|------|------|
| 1. 检查就绪 | 确认 Skill 文件和 README 存在 |
| 2. 安全检查 | 强制扫描敏感信息 |
| 3. 确认信息 | 展示仓库名、文件数，等待用户确认 |
| 4. 推送 GitHub | 支持 GitHub CLI / MCP / 手动 git |
| 5. 验证 | 确认推送成功，给出分享链接 |

## 📁 项目结构

```
skill-publisher/
├── .claude/
│   ├── skills/
│   │   ├── skill-builder.md      # 构建器 Skill
│   │   └── skill-publisher.md    # 发布器 Skill
│   └── commands/
│       ├── skill_builder.md      # /skill_builder 命令
│       └── skill_publisher.md    # /skill_publisher 命令
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
