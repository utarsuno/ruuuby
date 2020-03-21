
### Commands

| cmd | use-cases | see more |
| --- | --- | --- |
| bundle clean (--dry-run) (--force) | "cleans up unused gems in your bundler directory" | https://bundler.io/man/bundle-clean.1.html |
| gem install bundler:2.1.4 | install specific version of bundler | |
| gem outdated | | |
| gem environment | | |
| gem help commands | | |

### Operator Precedence Table

`table taken from: https://www.techotopia.com/index.php/Ruby_Operator_Precedence`

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
