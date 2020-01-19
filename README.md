# Ruuuby

```flavored modifications & extensions for increased quality of Ruby coding life```

| for | use |
| --- | --- |
| `Gemfile`  | `gem 'ruuuby', '~> 0.0.6'`  |
| library import | `require 'ruuuby'` |
| gem url | https://rubygems.org/gems/ruuuby |
| changelog | https://github.com/utarsuno/ruuuby/blob/master/CHANGELOG.md |

#### Language Changes:

| modified class   | additions       | desc. | notes |
| --------------- | --------------- | ----------------------------------------- | --- |
| `Object`        | methods         | [`ary?`, `bool?`, `int?`, `str?`, `sym?`] | |
| `Array`         | method          | `remove_empty!`                           | |
| `String`        | methods         | [`ensure_start!`, `ensure_ending!`]       | see func docs for notes regarding arg: `use_partial_fill_in` |
| `String`        | ordinary method | `>>` | prepend provided arg, reverse operation of `<<` |
| `NilClass`      | method          | `empty?`                                  | added for sake of `Array`'s func: `remove_empty!` |


#### Code Base Statistics:
| category | attribute     | value    | desc.                                   |
| -------- | ------------- | -------- | --------------------------------------- |
| QA       | unit          | 75       | # of tests                              |
| QA       | performance   | 12       | # of tests                              |
| coverage | LOCs          | 481      | lines of code covered                   |
| coverage | runtime       | 100      | % of LOCs executed during full QA suite |
| coverage | documentation | 100      | % of LOCs with enough documentation     |

### Gems:
| gem       | version | :development | :test | :production |
| ---       | ---     | ---          | ---   | ---         |
| rdoc      | 6.2.1   | ✅           | ❌    | ❌          |
| rake      | 13.0.1  | ✅           | ✅    | ❌          |
| rspec     | 3.9.0   | ✅           | ✅    | ❌          |
| rspec-benchmark | 0.5.1 | ✅ | ✅ | ❌ |
| simplecov | 0.17.1  | ✅           | ❌    | ❌          |

### Rake Tasks:
|  preface | cmd   | description   |
| ----- | ---   | ------------- |
| `bundle exec rake` | `rdoc` | generate documentation coverage report |
| `bundle exec rake` | `rspec` | run only non-performance based unit-tests|
| `bundle exec rake` | `rspec_performance` | run only performance based unit-tests|
| `bundle exec rake` | `rspec_all` | run all unit-tests |
| `bundle exec rake` | `install` | install gem onto local machine |
| `bin/` | `setup` | install dependencies |
| `bin/` | `console` | interactive console for easier experimenting |

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
