
### ENVs (TODO)

```
RUBYOPT="--jit"
--Jit-wait
--jit-verbose=n
--jit-min-calls=n
--jit-max-cache
--jit-save-temps
```

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

### Syntax Sugar

`table from: https://simpleror.wordpress.com/2009/03/15/q-q-w-w-x-r-s/#x`

| format | example | description |
| --- | --- | --- |
| %Q | %Q("hi") -> \"hi\" | alternative for "" |
| %q | | same as above but for single-quoted strings (no expression substitution or escape sequences) |
| %W | | for double-quoted array elements |
| %w | | same as above but for single-quoted strings |
| %x | | returns standard output of ran `cmd` |
| %r | | used to create `Regular Expressions` |
| %s | | used to created symbols (not subject to expression substitution or escape sequences) |

### TODOs:

 * resolve the following
 * http://davidmoulton.me/2013/04/01/resign-ruby-executable-in-osx.html
 
```

codesign -v $(which ruby)

"...code object is not signed at all"
```

```ruby
            require 'benchmark'
            puts Benchmark.measure {
              10_000.times do
                ::Math::NumberTheory::ℤ².gcd(1233, 5556)
              end
            }
```