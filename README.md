# Ruuuby

###### wip: flavored modifications & extensions for increased quality of Ruby coding life

#### Language Changes:
| class    | func added    |
| -----    | ------------- |
| Object   | int?          |
| Object   | ary?          |
| Object   | bool?         |
| Array    | remove_empty! |
| NilClass | empty?        |

#### Enums:
| |
| -----    |
| ::Ruuuby::Enum::Emoji    |

#### Gems:
| gem       | version | :development | :test | :production |
| ---       | ---     | ---          | ---   | ---         |
| rake      | 13.0.1  | ✅           | ✅    | ❌          |
| rspec     | 3.9.0   | ✅           | ✅    | ❌          |
| simplecov | 0.17.1  | ✅           | ❌    | ❌          |

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruuuby', '~> 0.0.3'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ruuuby

## Usage

```ruby
require 'ruuuby'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/utarsuno/ruuuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruuuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/utarsuno/ruuuby/blob/master/CODE_OF_CONDUCT.md).
