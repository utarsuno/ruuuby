
### ⚠️, file added early, wip

| term                     | definition | note  |
| ------------------------ | --------- | ----- |
| `database`               | container for storing organized data, usually a set of files | the layer between the `raw data` and the `DBMS` |
| `table`                  | structured list of data w/ each heaving a specific data type | must be unique, composing of: database name combined w/ table name, some implementations include the db owner as a starting identifier as well |
| `DBMS`                   | the software responsible for creating and manipulating the database |
| `schema`                 | information describing the metadata of the database and tables (layout, properties, etc) |
| `column`                 | single table field | the level of `granularity` is an important design decision, w/ `atomicity` often preferred |
| `field`                   | synonymous to `column` but also `calculated fields` which is just a logical grouping of information units composed of multiple `atomic fields` |
| `row`                    | record in table | |
| `data types`             | - | careful on datatype naming conventions, many `DBMS` implementations can utilize the same datatype name but have different rules applied |
| `primary key`            | one or more columns whose value(s) can be used to uniquely identify every single creatable row in the table | critical for avoiding lots of operational expensive for operations such as `updating` and `deleting` |
| `transactional database` | a `DBMS` offering `ACID properties` for set of operation within a `begin-commit` scope |
| `wildcards`              | "special characters used to match parts of a value" |
| `predicates`             | "when is an operator not an operator? When it is a `predicate`. Technically, `LIKE` is a predicate, not an operator. The end result is the same, just be aware of this term" |
| `aggregate functions`    | "functions that operate on a set of rows to calculate and return a single value" |
| `subqueries`             | queries that are embedded into other queries | in an `SQL statement`, the `inner-most subqueries` are always calculated first traversing outward |

| useful resource | url |
| --------------- | --- |
| `COLLATE`       | https://stackoverflow.com/questions/37984264/purpose-of-collate-in-postgres |
| `COLLATE`       | https://dba.stackexchange.com/questions/94887/what-is-the-impact-of-lc-ctype-on-a-postgresql-database |

#### `ACID properties`:

| term          | definition |
| ------------- | --------- |
| `Atomicity`   | `indivisible` such that the operation(s) either all occurs or not at all |
| `Consistency` | ensurance that a transaction only moves the `DB` from exactly one `state` to another |
| `Isolation`   | ensurance that `concurrent transacations` performed `iteratively` both result in same ending `DB state` |
| `Durability`  | ensurance that a transaction gets committed, even w/ a system failure |

 * `database transaction`:
   * single `unit-of-work` that applies a change to a Database w/ the guarantee of recoverability in the case of any sudden system failure
   * provides `isolation` between the `DB` and various `DBMS` to prevent erroneous states

 * primary key conditions:
   * "no two rows can have the same primary key value"
   * "every row must have a primary key value" (non-NULL)
   * "Values in primary key columns should never be modified or updated"
   * "should not be re-used" (a deleted row should not have it's primary key assigned for a newly created row)

 * SQL: Structured Query Language
   * `Standard SQL` is governed by the `ANSI standards committee` (and thus called `ANSI SQL`)
   * `DBMS` specific keywords will be very `vendor` specific
   * multiple statements are separated w/ the character{`;`}

## Query Tips & Notes

 * `SQL` processes the operator `AND` before the operator `OR`
   * reminder: use parenthesis to ensure needed groupings of operations
 * use the `IN` operator instead of longer concatenations of `OR` statements
 * unlike other operators, the `NOT` keyword can be used before the column to filter on, not just after it

### General Performance Tips

| scenario                                                                | resolution                                                                        |
| ----------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| generally `search operators` will perform better than using `wildcards` | if `query readability/complexity` is not significantly impacted, avoid `wildcards` |

### Example Queries

> tested with `postgresql`

| scenario              | query               |
| --------------------- | ------------------- |
| get current timestamp | `SELECT Now();`     |
| get current version   | `SELECT version();` |
| document later        | `COPY public.the_table(the_column_a, the_column_b) FROM '/tmp/data.csv' DELIMITER ',' CSV HEADER;` |

#### Math Functions Available

> note, many of the following functions will ignore NULL values all-together

 * `ABS()`
 * `COS()`
 * `EXP()`
 * `PI()`
 * `SIN()`
 * `SQRT()`
 * `TAN()`
 * `AVG()`
 * `COUNT()`
 * `MAX()`
 * `MIN()`
 * `SUM()`

## Wildcards (in context on search strings)

 | wildcard | meaning                                                                              | notes                                                                   |
 | -------- | ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------- |
 | `&`      | "match any number of occurrences of any character"                                   | not even the search string of just{`%`} will match against a `NULL row` |
 | `_`      | match any single character                                                           |                                                                         |
 | `[]`     | at position of brackets, match any character provided by the set within the brackets | this wildcard can be negated, ex: `SELECT name FROM names WHERE name LIKE '[^AB]%'`; # this query will return all names longer than one character, that do not start w/ `A` or `B` |

## `GROUP BY`

 * "if you have nested groups in your `GROUP BY` clause, data is summarized at the last specified group. In other words, all the columns specified are evaluated together when grouping is established (so you won't get data back for each individual column level"
 * "every column listed in `GROUP BY` must be a retrieved column or a valid expression (but not an aggregate function)"
 * must be after any `WHERE` and before any `ORDER BY`
 * "`WHERE` filters before data is grouped, and `HAVING` filters after data is grouped"
 * lots of variability by `DBMS`

### Reserved Words

> specific DBMS flavors will have their own variation of the following list, regardless, for general compatibility sake it's better to avoid naming anything that same as the following keywords

 * ABORT, ABSOLUTE, ACTION, ADD, AFTER, ALL, ALLOCATE, ALTER, ANALYZE, AND, ANY, ARE, AS, ASC, ASCENDING, ASSERTION, AT, AUTHORIZATION, AUTO, AUTO-INCREMENT, AUTOINC, AVG
 * BACKUP, BEFORE, BEGIN, BETWEEN, BIGINT, BINARY, BIT, BLOB, BOOLEAN, BOTH, BREAK, BROWSE, BULK, BY, BYTES
 * CACHE, CALL, CASCADE, CASCADED, CASE, CAST, CATALOG, CHANGE, CHAR, CHARACTER, CHARACTER_LENGTH, CHECK, CHECKPOINT, CLOSE, CLUSTER, CLUSTERED, COALESCE, COLLATE, COLUMN, COLUMNS, COMMENT, COMMIT, COMMITTED, COMPUTE, COMPUTED, CONDITIONAL, CONFIRM, CONNECT, CONNECTION, CONSTRAINT, CONSTRAINTS, CONTAINING, CONTAINS, CONTAINSTABLE, CONTINUE, CONTROLROW, CONVERT, COPY, COUNT, CREATE, CROSS, CSTRING, CUBE, CURRENT, CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP, CURRENT_USER, CURSOR
 * DATABASE, DATABASES, DATE, DATETIME, DAY, DBCC, DEALLOCATE, DEBUG, DEC, DECIMAL, DECLARE, DEFAULT, DELETE, DENT, DESC, DESCENDING, DESCRIBE, DISCONNECT, DISK, DISTINCT, DISTRIBUTED, DIV, DO, DOMAIN, DOUBLE, DROP, DUMMY, DUMP
 * ELSE, ELSEIF, ENCLOSED, END, ERRLVL, ERROREXIT, ESCAPE, ESCAPED, EXCEPT, EXCEPTION, EXEC, EXECUTE, EXISTS, EXIT, EXPLAIN, EXTEND, EXTERNAL, EXTRACT
 * FALSE, FETCH, FIELD, FIELDS, FFILE, FILLFACTOR, FILTER< FLOAT, FLOPPY, FOR, FORCE, FOREIGN, FOUND, FREETEXT, FREETEXTTABLE, FROM, FULL, FUNCTION
 * GENERATOR, GET, GLOBAL, GO, GOTO, GRANT, GROUP
 * HAVING, HOLDLOCK, HOUR
 * IDENTITY, IF, IN, INACTIVE, INDEX, INDICATOR, INFILE, INNER, INOUT, INPUT, INSENSITIVE, INSERT, INT, INTEGER, INTERSECT, INTERVAL, INTO, IS, ISOLATION
 * JOIN
 * KEY, KILL
 * LANGUAGE, LAST LEADING, LEFT, LENGTH, LEVEL, LIKE, LIMIT, LINENO, LINES, LISTEN, LOAD, LOCAL, LOCK, LOGFILE, LONG, LOWER
 * MANUAL, MATCH, MAX, MERGE, MESSAGE, MIN, MINUTE, MIRROREXIT, MODULE, MONEY, MONTH, MOVE
 * NAMES, NATIONAL, NATURAL, NCHAR, NEXT, NEW, NO, NOCHECK, NONCLUSTERED, NONE, NOT, NULL, NULLIF, NUMERIC
 * OF, OFF, OFFSET, OFFSETS, ON, ONCE, ONLY, OPEN, OPTION, OR, ORDER, OUTER, OUTPUT, OVER, OVERFLOW, OVERLAPS
 * PAD, PAGE, PAGES, PARAMETER, PARTIAL, PASSWORD< PERCENT, PERM, PERMANENT, PIPE, PLAN, POSITION, PRECISION, PREPARE, PRIMARY, PRINT, PRIOR, PRIVILEGES, PROC, PROCEDURE, PROCESSEXIT, PROTECTED, PUBLIC, PURGE
 * RAISEERROR, READ, READTEXT, REAL, REFERENCES, REGEXP, RELATIVE, RENAME, REPEAT, REPLACE, REPLICATION, REQUIRE, RESERV, RESERVING, RESET, RESTORE, RESTRICT, RETAIN, RETURN, RETURNS, REVOKE, RIGHT, ROLLBACK, ROLLUP, ROWCOUNT, RULE
 * SAVE, SAVEPOINT, SCHEMA, SECOND, SECTION, SEGMENT, SELECT, SENSITIVE, SEPARATOR, SEQUENCE, SESSION_USER, SET, SETUSER, SHADOW, SHARED< SHOW, SHUTDOWN, SINGULAR, SIZE, SMALLINT, SNAPSHOT, SOME, SORT, SPACE, SQL, SQLCODE, SQLERROR, STABILITY, STARTING, STARTS, STATISTICS, SUBSTRING, SUM, SUSPEND
 * TABLE, TABLES, TAPE, TEMP, TEMPORARY, TEXT, TEXTSIZE, THEN, TIME, TIMESTAMP, TO, TOP, TRAILING, TRAN, TRANSACTION, TRANSLATE, TRIGGER, TRIM, TRUE, TRUNCATE
 * UNCOMMITTED, UNION, UNIQUE, UNTIL, UPDATE, UPDATETEXT, UPPER, USAGE, USE, USER, USING
 * VALUE, VALUES, VARCHAR, VARIABLE, VARYING, VERBOSE, VIEW, VOLUME
 * WAIT, WAITFOR, WHEN, WHERE, WHILE, WITH, WORK, WRITE, WRITETEXT
 * XOR
 * YEAR
 * ZONE

### misc notes to organize

 * number of decimals displayed w/ numbers is `DBMS` specific
 * Databases are optimized to perform filtering quickly and efficiently, shifting too much of this work onto the client application will cause serious long-term scaling issues
 * generally the operators `!=` and `<>` can be easily interchanged, but this is still `DBMS` specific

# TODOs (short description)

| term                     | definition | note  |
| ------------------------ | --------- | ----- |
| all the normalization forms!!!!!! |
| `DDL`</n>`Database Definition Language` |
| `DML`</n>`Data Manipulation Language` |
| `DCL`</n>`Data Control Language` |
