# JSONPath

[English](README.md) | [中文](README_zh.md)

A command-line tool for processing JSON data using JSONPath expressions, compliant with RFC 9535.

## Features

- 🎨 Beautiful colored output
- 📖 RFC 9535 compliant implementation
- 🚀 Fast and efficient processing
- 💪 Support for complex JSONPath queries
- 🔧 Easy to use command-line interface

### Supported Features
- Complete RFC 9535 Implementation
  - Root node access (`$`)
  - Child node access (`.key` or `['key']`)
  - Recursive descent (`..`)
  - Array indices (`[0]`, `[-1]`)
  - Array slices (`[start:end:step]`)
  - Array wildcards (`[*]`)
  - Multiple indices (`[1,2,3]`)
  - Filter expressions (`[?(@.price < 10)]`)
- Command Line Tool (`jp`)
  - Beautiful colorized output
  - Syntax highlighting for JSON
  - File and stdin input support
  - Formatted and compact output options
  - User-friendly error messages
  - UTF-8 support with proper CJK display

## Installation

Using Homebrew:

```bash
brew install jsonpath
```

## Usage

### Basic Query

```bash
# Query from a file
jp '$.store.book[0].title' data.json

# Query from stdin
echo '{"name": "jp"}' | jp '$.name'

# Pretty print with colors
jp -p '$.store.book[*].title' data.json
```

### Advanced Examples

```bash
# Filter array elements
jp '$.store.book[?(@.price < 10)].title' data.json

# Array slice
jp '$.store.book[0:2].title' data.json

# Multiple queries
jp '$.store.book[*].title, $.store.book[*].author' data.json

# Count elements
jp '$.store.book.length()' data.json
```

### Supported Operators

- `$` - Root element
- `.` - Child operator
- `..` - Recursive descent
- `*` - Wildcard
- `[start:end:step]` - Array slice
- `[?(@.price > 10)]` - Filter expression
- `length()` - Array length function

## Options

```bash
jp --help

Usage: jp [options] <expression> [file...]

Options:
  -p, --pretty     Enable pretty print with colors
  -r, --raw        Output raw strings without quotes
  -h, --help       Show help information
  -v, --version    Show version information
```

## Examples with Sample Data

Given this JSON:
```json
{
  "store": {
    "book": [
      {
        "title": "The Go Programming Language",
        "price": 25.99
      },
      {
        "title": "Learning JSON",
        "price": 9.99
      }
    ]
  }
}
```

Query examples:
```bash
# Get all book titles
jp '$.store.book[*].title'
# Output: ["The Go Programming Language", "Learning JSON"]

# Get books cheaper than 10
jp '$.store.book[?(@.price < 10)].title'
# Output: ["Learning JSON"]
```

## Implementation Details

1. RFC 9535 Compliance
   - Support for all standard operators
   - Standard-compliant syntax parsing
   - Standard result formatting
2. Filter Support
   - Comparison operators: `<`, `>`, `<=`, `>=`, `==`, `!=`
   - Currently supports numeric comparisons
   - Future support for string comparisons and logical operators
3. Result Handling
   - Array operations return array results
   - Single value access returns original type
   - Type-safe result handling
4. Error Handling
   - Detailed error messages
   - Syntax error reporting
   - Runtime error handling

## License

MIT

## Author

David Hoo
