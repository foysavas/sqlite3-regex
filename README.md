# sqlite3-regexp

Adds three scalar functions to SQLite.

```sql
regexp_match(string, regex)
regexp_search(string, regex)
regexp_replace(string, regex, replacement)
```

Replacement strings include support for [grouping and conditionals](https://www.boost.org/doc/libs/1_53_0/libs/regex/doc/html/boost_regex/format/boost_format_syntax.html)

Stolen from [sqlite3-extras](https://github.com/SeanTater/sqlite3-extras) but with parameters reordered to more closely match other SQL dialects.