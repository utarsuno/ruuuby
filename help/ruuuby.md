
### Ruuuby Glossary

#### TODOs
```
 unicode:
 * https://www.honeybadger.io/blog/ruby-unicode-normalization/
 * https://idiosyncratic-ruby.com/41-proper-unicoding.html
 * https://rollout.io/blog/how-ruby-string-encoding-benefits-developers/

 investigate before adding NGINX:
 * https://www.speedshop.co/2018/03/28/nginx-unit-for-ruby.html
 * https://unit.nginx.org/configuration/#configuration-ruby
```

>#### Testing Tasks:
>| preface            | cmd                 | description of test contests | w/ warnings?
>| -----------------: | :-----------------: | :---------- | ----------:
>| `bundle exec rake` | `rspec_unit`        | all core expected functionality from `Ruuuby` | ❌ |
>| `bundle exec rake` | `rspec_integration` | expected state & functionality from `Ruuuby` code areas w/ using more than one feature/component | ❌ |
>| `bundle exec rake` | `rspec_db`          | anything relating to the `DB` or `ORM` | ❌ |
>| `bundle exec rake` | `rspec_audit`       | extra-checks for expected code-structure; ensures passing `Ruuuby` functionality tests are not occurring from any artifacts | ❌ |
>| `bundle exec rake` | `rspec_performance` | defines acceptable runtime-performance benchmarks (`TODO: missing Big-O tests`) | ❌ |
>| `bundle exec rake` | `rspec_tech_debt`   | tracks/confirms missing coverage; ∀ resolved-test-case will transfer to a new test-category, lowering the total count of `tech_debt` tests | ❌ |
>| `bundle exec rake` | `rspec_locale`      | extra-checks for properly configured local coding environment (`TODO: need to formalize Ruby build process`) | ❌ |
>| `bundle exec rake` | `rspec_all`         | run all existing tests | ✅ |

#### Temporary/Pseudo Code

```ruby

  def perform_big_o_constant(bla)
    RSpec::Benchmark::Matchers::ben
    exec_func_n_times = bench_range()
    expect{ |n, i| }
  end

```

### TODOs

 * formalize this into re-usable procedures

```ruby
require 'benchmark'
FIXNUM_MAX = (2**(0.size * 8 -2) -1)
MAX_SIZE = FIXNUM_MAX / 8192
Random.rand(MAX_SIZE)

data = []
(100..99999).each do |i|
  data << [Random.rand(i), Random.rand(i)]
end

def slow_gcd(a, b)
  a, b = b, a%b  until b.zero?
  a
end

def other_gcd(a, b)
  a.gcd(b)
end

def fast_gcd(a, b)
  ::Math::NumberTheory.fast_gcd(a, b)
end

Benchmark.bmbm do |x|
  x.report('slow_gcd') do
    50000.times do |i|
      slow_gcd(data[i][0], data[i][1])
    end
  end
  x.report('other_gcd') do
    50000.times do |i|
      data[i][0].gcd(data[i][1])
    end
  end
  x.report('fast_gcd') do
    50000.times do |i|
      ::Math::NumberTheory.fast_gcd(data[i][0], data[i][1])
      #fast_gcd(data[i][0], data[i][1])
    end
  end
end

puts Benchmark.measure {
  10000.times do |i|
    slow_gcd(data[i][0], data[i][1])
  end
}
puts Benchmark.measure {
  10000.times do |i|
    fast_gcd(data[i][0], data[i][1])
  end
}

require 'benchmark'
FIXNUM_MAX = (2**(0.size * 8 -2) -1)
MAX_SIZE = FIXNUM_MAX / 8192
Random.rand(MAX_SIZE)
data = []
(100..99999).each do |i|
  data << [Random.rand(i), Random.rand(i)]
end
puts Benchmark.measure {
  10000.times do |i|
    b = data[0, data.length-1]
  end
}
puts Benchmark.measure {
  10000.times do |i|
    b = data[0..data.length-2]
  end
}
puts Benchmark.measure {
  10000.times do |i|
    b = data[0...data.length-1]
  end
}
puts Benchmark.measure {
  10000.times do |i|
    b = data[0...-1]
  end
}

```

```
Rehearsal --------------------------------------------
slow_gcd   0.005331   0.000008   0.005339 (  0.005330)
fast_gcd   0.002493   0.000003   0.002496 (  0.002495)
----------------------------------- total: 0.007835sec

               user     system      total        real
slow_gcd   0.005161   0.000026   0.005187 (  0.005206)
fast_gcd   0.002382   0.000003   0.002385 (  0.002382)
```
