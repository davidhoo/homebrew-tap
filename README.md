# JSONPath

[English](README.md) | [中文](README_zh.md)

RFC 9535 compliant JSONPath implementation in Go with command-line tool and library.

## Features

- **100% RFC 9535 Compliant** - Passes all 703 compliance tests
- **Beautiful colored output** with syntax highlighting
- **Complete JSONPath support** - All standard selectors and functions
- **Fast and efficient** - Written in Go
- **Easy to use** - Simple command-line interface

## Installation

```bash
brew tap davidhoo/tap
brew install jsonpath
```

## Usage

### Basic Query

```bash
# Query from a file
jp -f data.json -p '$.store.book[0].title'

# Query from stdin
echo '{"name": "jp"}' | jp -p '$.name'

# Pretty print with colors
jp -f data.json -p '$.store.book[*].title'
```

### Filter Expressions

```bash
# Filter by price
jp -f data.json -p '$.store.book[?(@.price < 10)]'

# Complex filters
jp -f data.json -p '$.store.book[?(@.price > 10 && @.category == "fiction")]'

# Existence test
jp -f data.json -p '$[?@.name]'
```

### Functions (RFC 9535)

```bash
# Match with regex
jp -f data.json -p '$.store.book[?match(@.title, "^S.*")]'

# Search
jp -f data.json -p '$.store.book[?search(@.title, "Century")]'

# Count nodes
jp -f data.json -p '$[?count(@..*) > 5]'
```

### Non-Standard Extensions

```bash
# Min/Max/Avg/Sum
jp -f data.json -p '$.store.book[*].price.min()'
jp -f data.json -p '$.store.book[*].price.max()'

# Keys/Values
jp -f data.json -p '$.store.keys()'
jp -f data.json -p '$.store.values()'
```

### Normalized Path Output

```bash
# Show RFC 9535 Normalized Paths
echo '{"a":1,"b":2}' | jp --path '$.*'
# Output:
# $['a'] 1
# $['b'] 2
```

## Options

| Flag | Description |
|------|-------------|
| `-p` | JSONPath expression |
| `-f` | JSON file path (reads from stdin if not specified) |
| `-c` | Compact output |
| `--no-color` | Disable colored output |
| `--path` | Show Normalized Paths |
| `-v` | Show version |
| `-h` | Show help |

## RFC 9535 Compliance

This implementation fully complies with [RFC 9535](https://www.rfc-editor.org/rfc/rfc9535):

- All standard selectors (name, index, slice, wildcard, filter, recursive descent, union)
- All standard functions (`length`, `count`, `match`, `search`, `value`)
- I-Regexp pattern matching (RFC 9485)
- Normalized Path generation
- Three-valued logic in filter expressions

## Links

- [GitHub Repository](https://github.com/davidhoo/jsonpath)
- [Documentation](https://github.com/davidhoo/jsonpath#readme)
- [Changelog](https://github.com/davidhoo/jsonpath/blob/main/CHANGELOG.md)
- [Migration Guide](https://github.com/davidhoo/jsonpath/blob/main/MIGRATION.md)

## License

MIT
