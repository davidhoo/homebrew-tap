# JSONPath

[English](README.md) | [中文](README_zh.md)

完全符合 RFC 9535 标准的 Go 语言 JSONPath 实现，提供命令行工具和库。

## 特性

- **100% RFC 9535 合规** - 通过全部 703 项合规测试
- **优美的彩色输出** - JSON 语法高亮
- **完整的 JSONPath 支持** - 所有标准选择器和函数
- **快速高效** - 使用 Go 语言编写
- **简单易用** - 简洁的命令行界面

## 安装

```bash
brew tap davidhoo/tap
brew install jsonpath
```

## 使用方法

### 基本查询

```bash
# 从文件查询
jp -f data.json -p '$.store.book[0].title'

# 从标准输入查询
echo '{"name": "jp"}' | jp -p '$.name'

# 美化输出
jp -f data.json -p '$.store.book[*].title'
```

### 过滤表达式

```bash
# 按价格过滤
jp -f data.json -p '$.store.book[?(@.price < 10)]'

# 复杂过滤
jp -f data.json -p '$.store.book[?(@.price > 10 && @.category == "fiction")]'

# 存在性测试
jp -f data.json -p '$[?@.name]'
```

### 函数（RFC 9535）

```bash
# 正则匹配
jp -f data.json -p '$.store.book[?match(@.title, "^S.*")]'

# 搜索
jp -f data.json -p '$.store.book[?search(@.title, "Century")]'

# 计数
jp -f data.json -p '$[?count(@..*) > 5]'
```

### 非标准扩展

```bash
# 最小值/最大值/平均值/总和
jp -f data.json -p '$.store.book[*].price.min()'
jp -f data.json -p '$.store.book[*].price.max()'

# 键/值
jp -f data.json -p '$.store.keys()'
jp -f data.json -p '$.store.values()'
```

### 规范化路径输出

```bash
# 显示 RFC 9535 规范化路径
echo '{"a":1,"b":2}' | jp --path '$.*'
# 输出:
# $['a'] 1
# $['b'] 2
```

## 命令行选项

| 选项 | 说明 |
|------|------|
| `-p` | JSONPath 表达式 |
| `-f` | JSON 文件路径（不指定则从标准输入读取） |
| `-c` | 压缩输出 |
| `--no-color` | 禁用彩色输出 |
| `--path` | 显示规范化路径 |
| `-v` | 显示版本 |
| `-h` | 显示帮助 |

## RFC 9535 合规性

本实现完全符合 [RFC 9535](https://www.rfc-editor.org/rfc/rfc9535) 标准：

- 所有标准选择器（名称、索引、切片、通配符、过滤、递归查找、联合）
- 所有标准函数（`length`、`count`、`match`、`search`、`value`）
- I-Regexp 模式匹配（RFC 9485）
- 规范化路径生成
- 过滤表达式中的三值逻辑

## 链接

- [GitHub 仓库](https://github.com/davidhoo/jsonpath)
- [文档](https://github.com/davidhoo/jsonpath#readme)
- [更新日志](https://github.com/davidhoo/jsonpath/blob/main/CHANGELOG.md)
- [迁移指南](https://github.com/davidhoo/jsonpath/blob/main/MIGRATION.md)

## 许可证

MIT
