
### Commands

| cmd | use-cases | see more |
| --- | --- | --- |
| bundle clean (--dry-run) (--force) | "cleans up unused gems in your bundler directory" | https://bundler.io/man/bundle-clean.1.html |
| gem install bundler:2.1.4 | install specific version of bundler | |
| gem outdated | | |
| gem environment | | |
| gem help commands | | |

### Operator Precedence Table

`table from: https://www.techotopia.com/index.php/Ruby_Operator_Precedence`

| as method? | operator | description |
| --- | --- | --- |
| ✅ | `[]`, `[]=`              | element reference, element set |
| ✅ | `**`                     | exponentiation (raise to power) |
| ✅ | `!`, `~`, `+`, `-`       | not, complement, unary plus and minus (method names for last two are `+@` and `-@` |
| ✅ | `*`, `/`, `%`            | multiply, divide, modulo |
| ✅ | `+`, `-`                 | addition and subtraction |
| ✅ | `>>`, `<<`               | right, left bitwise shift |
| ✅ | `&`                      | bitwise `AND` |
| ✅ | `^`, pipe-divider-chars  | bitwise exclusive `OR` and regular `OR` |
| ✅ | `<=`, `<`, `>`, `>=`     | comparison operators |
| ✅ | `<=>`, `==`, `===`, `!=`, `=~`, `!~` | equality and pattern match operators (`!=` and `!~` may not be defined as methods) |
| ❌ | `&&`                     | logical `AND` |
| ❌ | 2 pip-divider-chars      | logical `OR` |
| ❌ | `..`, `...`              | range (inclusive and exclusive) |
| ❌ | `?` `:`                  | ternary if-then-else |
| ❌ | `=`, `%=`, `{`, `/=`, `-=`, `pipe-divider-char=`, `&=`, `>>=`, `<<=`, `*=`, `&&=`, `2-pipe-divider-chars=`, `**=` | assignment |
| ❌ | `defined?`                | check if specified symbol defined |
| ❌ | `not`                    | logical negation |
| ❌ | `or`, `and`              | logical composition |
| ❌ | `if`, `unless`, `while`, `until` | expression modifiers |
| ❌ | `begin/end`              | block expression |

### $GLOBALS

`table from: https://www.techotopia.com/index.php/Ruby_Variable_Scope`

| Variable Name | Variable Value |
| ------------- | -------------- |
| $@ | The location of latest error |
| $_ | The string last read by gets |
| $. | The line number last read by interpreter |
| $& | The string last matched by regexp |
| $~ | The last regexp match, as an array of subexpressions |
| $n | The nth subexpression in the last match (same as $~[n]) |
| $= | The case-insensitivity flag |
| $/ | The input record separator |
| $\ | The output record separator |
| $0 | The name of the ruby script file currently executing |
| $* | The command line arguments used to invoke the script |
| $$ | The Ruby interpreter's process ID |
| $? | The exit status of last executed child process |
