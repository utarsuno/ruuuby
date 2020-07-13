# encoding: UTF-8

using ::Math::Algebra::Tropical::ContextNumeric
using ::Math::Algebra::Tropical::ContextMatrix

RSpec.describe 'f38_b03' do

  context 'functionality for{f38_b03}' do

    context 'creates class{CurrencyMatrix} as needed' do

      context 'w/ needed constructor' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            # @see attribution{0x0} at bottom of this source file for source of data scenario:
            the_labels = %w(USD EUR GBP JPY CAD)
            raw_data   = ::Matrix[
                [0.0,-0.08538,-0.197944,4.646478,0.288486],
                [0.08538,0.0,-0.112648,4.732008,0.374006],
                [0.197944,0.112648,0.0,4.844532,0.486533],
                [-4.646478,-4.732008,-4.844532,0.0,-4.358143],
                [-0.288486,-0.374006,-0.486533,4.358142,0.0]
            ]
            data = ::Math::Forex::CurrencyMatrix.new(the_labels, raw_data)
            expect(data.labels).to eq(the_labels)
            expect(data.data).to eq(raw_data)
          end
        end
      end

    end

  end # end: {functionality for{f38_b03}}

  context 'audits', :audit do
    context '{f38} passes audits' do
      it 'by finding needed Modules' do
        expect(🧬.∃ᵐ?(:Forex, ::Math)).to eq(true)
        expect(🧬.∃ᶜ?(:CurrencyMatrix, ::Math::Forex)).to eq(true)
        expect(🧬.∃ᶜ?(:Matrix)).to eq(true)
      end
    end
  end # end: {audit}

  context 'locale', :locale do
    context 'class{Matrix} is correctly defined' do
      it 'w/ expected version{0.2.0}' do
        expect(::Matrix::VERSION).to eq('0.2.0')
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
