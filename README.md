# Skill Publisher — Claude Code Skill 打包发布工具

一个 **Claude Code Skill**，帮你把 `.claude/skills/` 中的 Skill 项目打包、安全检查、生成 README，并一键推送到 GitHub。

## ✨ 功能

| 步骤 | 说明 |
|------|------|
| 1. 扫描项目 | 自动识别需要打包的文件，排除敏感/临时文件 |
| 2. 安全检查 | 扫描密码、API Key、硬编码邮箱、绝对路径等 |
| 3. 生成 README | 自动生成包含架构图、安装方法、使用说明的 README |
| 4. 生成 install.sh | 创建一键安装脚本 |
| 5. 生成 .gitignore | 确保敏感文件不被提交 |
| 6. 推送到 GitHub | 支持 GitHub CLI / MCP / 手动 git |
| 7. 验证 | 确认推送成功，给出分享链接 |

## 📦 安装

```bash
# 复制到你的项目
mkdir -p /path/to/your/project/.claude/skills
cp .claude/skills/skill-publisher.md /path/to/your/project/.claude/skills/
```

## 🚀 使用

在 Claude Code 中说：

- `"打包 skill"` / `"发布 skill"`
- `"推送到 GitHub"` / `"push to GitHub"`
- `"检查一下有没有敏感信息"`
- `"帮我写个 README"`

## 🔒 安全检查项

- 邮箱密码 / App Password
- API Key（`SG.` / `re_` / `sk_` 开头）
- 硬编码邮箱地址
- 绝对路径（`/Users/xxx/...`）
- token / secret / credential 赋值

## 📄 License

MIT
