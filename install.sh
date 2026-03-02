#!/bin/bash
# Skill Generator & Publisher — 一键安装脚本

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "=========================================="
echo "  Skill Generator & Publisher Installer"
echo "=========================================="
echo ""

# 检查目标目录
if [ "$1" != "" ]; then
    TARGET_DIR="$1"
else
    TARGET_DIR="$(pwd)"
fi

# 如果在源目录内运行
if [ "$TARGET_DIR" = "$SCRIPT_DIR" ]; then
    echo -e "${GREEN}✅ 当前目录已包含 Skill Publisher，可以直接使用。${NC}"
    echo ""
    echo "启动方式："
    echo "  cd $SCRIPT_DIR"
    echo "  claude"
    echo ""
    echo "然后输入："
    echo "  /publish"
    echo "  或说 \"把这个能力打包成 skill\""
    exit 0
fi

echo "目标项目: $TARGET_DIR"
echo ""

# 检查目标目录是否存在
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}❌ 目标目录不存在: $TARGET_DIR${NC}"
    exit 1
fi

# 复制 Skill 文件
echo -e "${GREEN}[1/2] 复制 Skill 文件...${NC}"
mkdir -p "$TARGET_DIR/.claude/skills"
cp "$SCRIPT_DIR/.claude/skills/skill-publisher.md" "$TARGET_DIR/.claude/skills/"
echo "  → .claude/skills/skill-publisher.md"

# 复制 Command 文件（斜杠命令）
echo -e "${GREEN}[2/2] 复制斜杠命令...${NC}"
mkdir -p "$TARGET_DIR/.claude/commands"
if [ -f "$SCRIPT_DIR/.claude/commands/publish.md" ]; then
    cp "$SCRIPT_DIR/.claude/commands/publish.md" "$TARGET_DIR/.claude/commands/"
    echo "  → .claude/commands/publish.md （/publish 命令）"
fi

echo ""
echo "=========================================="
echo -e "${GREEN}✅ 安装完成！${NC}"
echo "=========================================="
echo ""
echo "使用方式："
echo "  cd $TARGET_DIR"
echo "  claude"
echo ""
echo "然后："
echo "  输入 /publish               — 打包发布已有 Skill"
echo "  说 \"把这个打包成 skill\"     — 从对话中生成新 Skill"
echo "  说 \"检查敏感信息\"           — 仅安全扫描"
echo ""
