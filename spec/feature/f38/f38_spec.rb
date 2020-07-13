# encoding: UTF-8

using ::Math::Algebra::Tropical::ContextNumeric
using ::Math::Algebra::Tropical::ContextMatrix

RSpec.describe 'f38' do

  context 'hybrid tests', :integration do

    context '{f38} all feature behaviors tested together' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          context 'w/ smaller data sets' do
            it 'w/ normalization performed' do
              # @see attribution{0x0} at bottom of this source file for source of data scenario:
              data = ::Math::Forex::CurrencyMatrix.new(
                  %w(USD EUR JPY),
                  ::Matrix[[1.0,0.5,100.0],[2.0,1.0,133.0+(1.0/3.0)],[0.01,0.0075,1.0]]
              )
              data.η̂!
              data.algo_🌴_arbitrage

              expect(data.cached_stats[:karp_vals][0]).to eq(0.13515503603605486)
              expect(data.cached_stats[:karp_vals][1]).to eq(0.13515503603605483)
              expect(data.cached_stats[:karp_vals][2]).to eq(0.13515503603605486)

              expect(data.cached_stats[:power_layers][0]).to eq([0.0, 0.0, 0.0])
              expect(data.cached_stats[:power_layers][1]).to eq([0.405465, 0.405465, 0.405465])

              expect(data.cached_stats[:power_layer_scores]).to eq([4.440892098500626e-16, 0.13515503603605486])

              # final result
              expect(data.cached_stats[:num_trades]).to eq(3)
              expect(data.cached_stats[:currencies_in_trade]).to eq(%w(USD EUR JPY))
            end
            it 'w/o normalization needed' do
              mi   = ::Float::INFINITY_NEGATIVE
              data = ::Math::Forex::CurrencyMatrix.new(
                  %w(CURRENCY_A CURRENCY_B CURRENCY_C CURRENCY_D),
                  ::Matrix[[mi,1.0,2.25,1.5],[3.0,mi,2.0,mi],[mi,mi,mi,-4.0],[3.0,mi,mi,mi]]
              )
              data.algo_🌴_arbitrage

              expect(data.cached_stats[:karp_vals]).to eq([2.25,2.25,2.25,2.25])
              expect(data.cached_stats[:power_layer_scores]).to eq([2.25,0.4166666666666667,2.25])

              # final result
              expect(data.cached_stats[:num_trades]).to eq(2)
              expect(data.cached_stats[:currencies_in_trade]).to eq(%w(CURRENCY_A CURRENCY_D))
            end
          end

          context 'w/ 5 pairs' do

            it 'first scenario test passes' do
              # @see attribution{0x0} at bottom of this source file for source of data scenario:
              data = ::Math::Forex::CurrencyMatrix.new(
                  %w(USD EUR GBP JPY CAD),
                  ::Matrix[
                      [0.0,-0.085627,-0.198195,4.64651,0.28835],
                      [0.085627,0.0,-0.112614,4.73197,0.37396],
                      [0.198195,0.112614,0.0,4.84457,0.48662],
                      [-4.64651,-4.73197,-4.84457,0.0,-4.35815],
                      [-0.28835,-0.37396,-0.48662,4.35815,0.0]
                  ]
              )
              data.algo_🌴_arbitrage

              expect(data.cached_stats[:karp_vals]).to eq(::Array.new(5, 6.666666666680736e-05))

              expect(data.cached_stats[:power_layers][0]).to eq([0.0, 0.0, 0.0, 0.0, 0.0])
              expect(data.cached_stats[:power_layers][1]).to eq([0.000167, 0.000167, 0.0002, 0.0002, 0.0002])
              expect(data.cached_stats[:power_layers][2]).to eq([0.00021, 0.000186, 0.00021, 0.00021, 0.00021])
              expect(data.cached_stats[:power_layers][3]).to eq([0.000232, 0.000232, 0.000232, 0.000232, 0.000232])

              expect(data.cached_stats[:power_layer_scores]).to eq([1.1125369292536007e-308, 6.666666666680736e-05, 5.250000000009414e-05, 4.6400000000121346e-05])

              # final result
              expect(data.cached_stats[:num_trades]).to eq(3)
              expect(data.cached_stats[:currencies_in_trade]).to eq(%w(GBP JPY CAD))
            end

            it 'scenario w/ 5 trades > 3 trades' do
              # @see attribution{0x0} at bottom of this source file for source of data scenario:
              data = ::Math::Forex::CurrencyMatrix.new(
                  %w(USD EUR GBP JPY CAD),
                  ::Matrix[
                      [0.0,-0.08538,-0.197944,4.646478,0.288486],
                      [0.08538,0.0,-0.112648,4.732008,0.374006],
                      [0.197944,0.112648,0.0,4.844532,0.486533],
                      [-4.646478,-4.732008,-4.844532,0.0,-4.358143],
                      [-0.288486,-0.374006,-0.486533,4.358143,0.0]
                  ]
              )
              data.algo_🌴_arbitrage

              expect(data.cached_stats[:karp_vals]).to eq([7.49999999999973e-05, 7.500000000008056e-05, 7.500000000006391e-05, 7.500000000000284e-05, 7.500000000000284e-05])

              expect(data.cached_stats[:power_layers][0]).to eq([0.0, 0.0, 0.0, 0.0, 0.0])
              expect(data.cached_stats[:power_layers][1]).to eq([0.000151, 0.00015, 0.000144, 0.000151, 0.000151])
              expect(data.cached_stats[:power_layers][2]).to eq([0.000291, 0.000291, 0.000265, 0.000291, 0.000291])
              expect(data.cached_stats[:power_layers][3]).to eq([0.000375, 0.000375, 0.000375, 0.000375, 0.000375])

              expect(data.cached_stats[:power_layer_scores]).to eq([1.1125369292536007e-308, 5.0333333333337414e-05, 7.275000000005194e-05, 7.500000000008056e-05])

              # final result
              expect(data.cached_stats[:num_trades]).to eq(5)
              expect(data.cached_stats[:currencies_in_trade]).to eq(%w(USD EUR GBP JPY CAD))
            end

          end
        end
      end
    end

  end

  context 'audits', :audit do
    context '{f38} passes audits' do
      it 'by finding needed Modules' do
        expect(🧬.∃ᵐ?(:Algebra, ::Math)).to eq(true)
        expect(🧬.∃ᵐ?(:Tropical, ::Math::Algebra)).to eq(true)
        expect(🧬.∃ᵐ?(:ContextNumeric, ::Math::Algebra::Tropical)).to eq(true)
        expect(🧬.∃ᵐ?(:ContextMatrix, ::Math::Algebra::Tropical)).to eq(true)
      end
    end
  end

end

#         __    __               __               __
#        /\ \__/\ \__         __/\ \             /\ \__  __
#    __  \ \ ,_\ \ ,_\  _ __ /\_\ \ \____  __  __\ \ ,_\/\_\    ___     ___     ____  __
#  /'__`\ \ \ \/\ \ \/ /\`'__\/\ \ \ '__`\/\ \/\ \\ \ \/\/\ \  / __`\ /' _ `\  /',__\/\_\
# /\ \L\.\_\ \ \_\ \ \_\ \ \/ \ \ \ \ \L\ \ \ \_\ \\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\/_/_
# \ \__/.\_\\ \__\\ \__\\ \_\  \ \_\ \_,__/\ \____/ \ \__\\ \_\ \____/\ \_\ \_\/\____/ /\_\
#  \/__/\/_/ \/__/ \/__/ \/_/   \/_/\/___/  \/___/   \/__/ \/_/\/___/  \/_/\/_/\/___/  \/_/
#
# | #    | source URL                                                                         |
# | ---- | ---------------------------------------------------------------------------------- |
# | 0x0  | https://commons.lib.jmu.edu/cgi/viewcontent.cgi?article=1303&context=honors201019  |
