# JSONPath

[English](README.md) | [中文](README_zh.md)

一个用于处理 JSON 数据的命令行工具，使用 JSONPath 表达式，完全符合 RFC 9535 标准。

## 特性

- 🎨 优美的彩色输出
- 📖 完全符合 RFC 9535 标准
- 🚀 快速高效的处理
- 💪 支持复杂的 JSONPath 查询
- 🔧 简单易用的命令行界面

### 支持的功能
- 完整实现 RFC 9535 标准
  - 根节点访问 (`$`)
  - 子节点访问 (`.key` 或 `['key']`)
  - 递归查询 (`..`)
  - 数组索引 (`[0]`, `[-1]`)
  - 数组切片 (`[start:end:step]`)
  - 数组通配符 (`[*]`)
  - 多重索引 (`[1,2,3]`)
  - 过滤表达式 (`[?(@.price < 10)]`)
- 命令行工具 (`jp`)
  - 美观的彩色输出
  - JSON 语法高亮
  - 支持文件和标准输入
  - 格式化和紧凑输出选项
  - 友好的错误提示
  - 支持 UTF-8 和 CJK 字符显示

## 安装

使用 Homebrew 安装：

```bash
brew install jsonpath
```

## 使用方法

### 基本查询

```bash
# 从文件中查询
jp '$.store.book[0].title' data.json

# 从标准输入查询
echo '{"name": "jp"}' | jp '$.name'

# 美化输出（带颜色）
jp -p '$.store.book[*].title' data.json
```

### 高级示例

```bash
# 过滤数组元素
jp '$.store.book[?(@.price < 10)].title' data.json

# 数组切片
jp '$.store.book[0:2].title' data.json

# 多重查询
jp '$.store.book[*].title, $.store.book[*].author' data.json

# 计算元素数量
jp '$.store.book.length()' data.json
```

### 支持的操作符

- `$` - 根元素
- `.` - 子元素操作符
- `..` - 递归下降
- `*` - 通配符
- `[start:end:step]` - 数组切片
- `[?(@.price > 10)]` - 过滤表达式
- `length()` - 数组长度函数

## 命令行选项

```bash
jp --help

用法：jp [选项] <表达式> [文件...]

选项：
  -p, --pretty     启用美化输出（带颜色）
  -r, --raw        输出原始字符串（不带引号）
  -h, --help       显示帮助信息
  -v, --version    显示版本信息
```

## 示例数据演示

给定以下 JSON：
```json
{
  "store": {
    "book": [
      {
        "title": "Go 语言程序设计",
        "price": 25.99
      },
      {
        "title": "JSON 学习指南",
        "price": 9.99
      }
    ]
  }
}
```

查询示例：
```bash
# 获取所有书籍标题
jp '$.store.book[*].title'
# 输出：["Go 语言程序设计", "JSON 学习指南"]

# 获取价格低于 10 的书籍
jp '$.store.book[?(@.price < 10)].title'
# 输出：["JSON 学习指南"]
```

## 实现细节

1. RFC 9535 标准合规性
   - 支持所有标准操作符
   - 符合标准的语法解析
   - 标准的结果格式化
2. 过滤器支持
   - 比较操作符：`<`, `>`, `<=`, `>=`, `==`, `!=`
   - 当前支持数值比较
   - 未来将支持字符串比较和逻辑操作符
3. 结果处理
   - 数组操作返回数组结果
   - 单值访问返回原始类型
   - 类型安全的结果处理
4. 错误处理
   - 详细的错误信息
   - 语法错误报告
   - 运行时错误处理

## 许可证

MIT

## 作者

David Hoo