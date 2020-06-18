# sqlite3-regexp

Adds three scalar functions to SQLite.

```sql
regexp_match(string, regex)
regexp_search(string, regex)
regexp_replace(string, regex, replacement)
```

## Examples

`regexp_match` matches against the entire string returning `0` or `1`.
```
SELECT REGEXP_MATCH('2020-01-01', '2020');

0

SELECT REGEXP_MATCH('2020-01-01', '2020-.*');

1
```

`regexp_search` matches against any part of the string returning `0` or `1`.
```
SELECT REGEXP_SEARCH('duck duck', 'goose');

0

SELECT REGEXP_SEARCH('duck duck goose', 'goose');

1
```

`regexp_replace` matches against any part of the string returning the formatted replacement.
```
SELECT REGEXP_REPLACE('1/1/1985', '([0-9]+)/([0-9]+)/([0-9]+)', '\3-\1-\2');

1985-1-1
```

Replacement strings also include support for [grouping and conditionals](https://www.boost.org/doc/libs/1_53_0/libs/regex/doc/html/boost_regex/format/boost_format_syntax.html) and literal parenthesis must be escaped.
```
SELECT REGEXP_REPLACE('1/1/1985', '([0-9])?([0-9])/([0-9])?([0-9])/([0-9]*)', '\(\5-(?{3}\3:0)\4-(?{1}\1:0)\2\)');

(1985-01-01)
```



## Credit

Stolen from [sqlite3-extras](https://github.com/SeanTater/sqlite3-extras) but with parameters reordered to more closely match other SQL dialects.