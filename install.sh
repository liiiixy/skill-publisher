#!/bin/bash
# Skill Builder & Publisher — 一键安装脚本

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "=========================================="
echo "  Skill Builder & Publisher Installer"
echo "=========================================="
echo ""

if [ "$1" != "" ]; then
    TARGET_DIR="$1"
else
    TARGET_DIR="$(pwd)"
fi

if [ "$TARGET_DIR" = "$SCRIPT_DIR" ]; then
    echo -e "${GREEN}✅ 当前目录已包含 Skill Builder & Publisher，可以直接使用。${NC}"
    echo ""
    echo "启动方式："
    echo "  cd $SCRIPT_DIR"
    echo "  claude"
    echo ""
    echo "然后输入："
    echo "  /skill_builder     — 从对话中生成 Skill"
    echo "  /skill_publisher   — 发布到 GitHub"
    exit 0
fi

echo "目标项目: $TARGET_DIR"
echo ""

if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}❌ 目标目录不存在: $TARGET_DIR${NC}"
    exit 1
fi

# 复制 Skill 文件
echo -e "${GREEN}[1/2] 复制 Skill 文件...${NC}"
mkdir -p "$TARGET_DIR/.claude/skills"
for skill_file in "$SCRIPT_DIR/.claude/skills/"*.md; do
    cp "$skill_file" "$TARGET_DIR/.claude/skills/"
    echo "  → .claude/skills/$(basename "$skill_file")"
done

# 复制斜杠命令
echo -e "${GREEN}[2/2] 复制斜杠命令...${NC}"
mkdir -p "$TARGET_DIR/.claude/commands"
for cmd_file in "$SCRIPT_DIR/.claude/commands/"*.md; do
    cp "$cmd_file" "$TARGET_DIR/.claude/commands/"
    echo "  → .claude/commands/$(basename "$cmd_file") （/$(basename "$cmd_file" .md) 命令）"
done

echo ""
echo "=========================================="
echo -e "${GREEN}✅ 安装完成！${NC}"
echo "=========================================="
echo ""
echo "使用方式："
echo "  cd $TARGET_DIR"
echo "  claude"
echo ""
echo "快捷命令："
echo "  /skill_builder     — 从对话中生成 Skill + 打包"
echo "  /skill_publisher   — 发布到 GitHub"
echo ""
echo "或者说："
echo "  \"把这个打包成 skill\""
echo "  \"发布到 GitHub\""
echo ""
