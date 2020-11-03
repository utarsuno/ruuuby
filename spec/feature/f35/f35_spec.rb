# encoding: UTF-8

RSpec.describe 'f35' do

  context 'temp location', :rng do
    context 'rng.rb' do

      it 'func{🎲.𝔦𝔦}' do
        # @see http://www.clayford.net/statistics/how-many-rolls-of-a-die-to-see-all-sides-at-least-once/
        num_trails_expected_on_avg = 15
        side_counts                = [0,0,0,0,0,0]
        allowed_maximum_trials     = ((num_trails_expected_on_avg ** 𝚽) ** 𝚽).to_i
        num_trails_executed        = 0
        num_trail_counter          = 0
        all_sides_hit              = false
        allowed_maximum_trials.∀ do ||
          side_counts[🎲.𝔦𝔦(0, 5)] += 1
          if num_trails_executed < num_trails_expected_on_avg || num_trail_counter == num_trails_expected_on_avg
            all_sides_hit = !(side_counts.any?{|i| i == 0})
            if all_sides_hit
              break
            end
            num_trail_counter = 0
          else
            num_trail_counter += 1
          end
          num_trails_executed += 1
        end

        delta_off = num_trails_executed < num_trails_expected_on_avg ? num_trails_expected_on_avg - num_trails_executed : num_trails_executed - num_trails_expected_on_avg

        puts "| 00 | #{num_trails_executed.to_s} | TODO | #{delta_off.to_s} |"

        expect(all_sides_hit).to eq(true)
      end

      it 'func{🎲.𝔣}' do
        the_sum = 0.0
        99999.∀ do ||
          the_sum += 🎲.𝔣
        end
        the_average = the_sum / 99999.0
        percent_err = ::Math::Stats::Descriptive.percentage_error(0.5,the_average)
        delta_off   = (0.05 - percent_err).abs

        puts "| 01 | #{the_average.to_s} | #{percent_err.to_s} | #{delta_off.to_s} |"

        expect(percent_err < 0.05)
      end

    end
  end

  context 'hybrid tests', :integration do
    context 'dual-behaviors' do

      context 'feature{f35}, behaviors{b00, b03}' do
        it '{simple_moving_average} matches data provided from {arithmetic_mean}' do
          data = [1337, (🎲.𝔦(1337)), (🎲.𝔦(1337)), (🎲.𝔦(1337)), (🎲.𝔦(1337))]
          expect(::Math::Stats.μ(*data)).to eq(::Math::Stats::TimeSeries.simple_moving_average(data, data.length)[0])
        end
      end # end: {feature{f35}, behaviors{b00, b03}}

    end # end: {dual-behaviors}
  end # end: {integration}

end
