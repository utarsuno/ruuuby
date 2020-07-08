# coding: UTF-8

RSpec.describe 'f22_b00' do

  context 'locale', :locale do
    context 'feature{f22}' do
      context 'behavior{b00}: Garbage-Collector{GC}' do

        it 'is not overclocked' do
          expect(💎.engine.gc.overclocked?).to eq(false)
        end

        context 'Profiler' do
          it 'is disabled' do
            expect(💎.engine.gc.profiler?).to eq(false)
          end
        end

        context 'has expected configs for arch{x84_64}' do
          it '40 bytes per object slot' do
            expect(💎.engine.gc.stats_bytes_per_object_slot).to eq(40)
          end
          it '408 slots per heap page' do
            expect(💎.engine.gc.stats_slots_per_heap_page).to eq(408)
          end
          it 'expect {heap_allocated_pages} == {heap_eden_pages} + {heap_tomb_page_length}' do
            expect(::GC.stat(:heap_allocated_pages)).to eq(::GC.stat(:heap_eden_pages) + ::GC.stat(:heap_tomb_pages))
          end
          it 'live slots can be measured in 3 different ways' do
            # three ways to measure live slots
            sum_a = ::ObjectSpace.count_objects
            sum_a = sum_a[:TOTAL] - sum_a[:FREE]
            sum_b = ::GC.stat(:heap_live_slots)
            sum_c = ::GC.stat(:total_allocated_objects) - ::GC.stat(:total_freed_objects)

            # TODO: try disabling the GC to test impact on measurement accuracy
            expect(::Math::Stats::Descriptive.relative_difference(sum_a.to_f, sum_b.to_f) < 0.10).to eq(true)
            expect(::Math::Stats::Descriptive.relative_difference(sum_a.to_f, sum_c.to_f) < 0.10).to eq(true)
            expect(::Math::Stats::Descriptive.relative_difference(sum_b.to_f, sum_c.to_f) < 0.10).to eq(true)
          end

          context 'has expected ENV_VARs for{RUBY_GC}' do
            it '{RUBY_GC_HEAP_INIT_SLOTS} == {40000} (4x the default)' do
              expect(ENV['RUBY_GC_HEAP_INIT_SLOTS']).to eq('40000')
            end
            it '{RUBY_GC_HEAP_FREE_SLOTS} == {16384} (4x the default)' do
              expect(ENV['RUBY_GC_HEAP_FREE_SLOTS']).to eq('16384')
            end
            it '{RUBY_GC_HEAP_GROWTH_FACTOR} == {1.6180} (default is 1.8)' do
              expect(ENV['RUBY_GC_HEAP_GROWTH_FACTOR']).to eq('1.6180')
            end
            it '{RUBY_GC_HEAP_GROWTH_MAX_SLOTS} == {0} (default is 0)' do
              expect(ENV['RUBY_GC_HEAP_GROWTH_MAX_SLOTS']).to eq('0')
            end
            it '{RUBY_GC_HEAP_FREE_SLOTS_MIN_RATIO} == {0.25} (default is 0.20)' do
              expect(ENV['RUBY_GC_HEAP_FREE_SLOTS_MIN_RATIO']).to eq('0.25')
            end
            it '{RUBY_GC_HEAP_FREE_SLOTS_MAX_RATIO} == {0.60} (default is 0.65)' do
              expect(ENV['RUBY_GC_HEAP_FREE_SLOTS_MAX_RATIO']).to eq('0.60')
            end
            it '{RUBY_GC_MALLOC_LIMIT_MAX} == {67108864} 64MB (default is 33554432) 32MB' do
              expect(ENV['RUBY_GC_MALLOC_LIMIT_MAX']).to eq('67108864')
            end
          end

        end

      end

    end
  end

end
