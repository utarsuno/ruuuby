
## Before Version Release

#### preparing documentation)
 | for  | script  | cmd |
 | ---- | ---- | --- |
 | `CHANGELOG.md` | `./bin/console_db` | `$ruuuby.engine.orm.get_upcoming_changelog` |

### Version Release

| step | perform | notes|
| --- | --- | --- |
| 0   | run `./bin/console_db` |
| 1   | enter `💎.engine.api.sync_git_commit_history` | atm `DNE` |
| 2   | exit |
| 3   | `step-0` |
| 4   | enter `💎.engine.api.sync_version_number` | atm `DNE` |

	# ╔═════════════════════════════════════════════════════════════════════════════╗
	# ║ 0x0) ./bin/console_db  ║ 0x1) puts @ruuuby_gemspec.generate_source          ║
	# ╠═════════════════════════════════════════════════════════════════════════════╣

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
