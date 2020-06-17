# sqlite3-regexp

Adds three scalar functions to SQLite.

```sql
regexp_match(string, regex)
regexp_search(string, regex)
regexp_replace(string, regex, reaplcement)
```

Stolen from [sqlite3-extras](https://github.com/SeanTater/sqlite3-extras) but with parameters reordered to more closely match other SQL dialects.