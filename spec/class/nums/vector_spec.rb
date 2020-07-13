# encoding: UTF-8

RSpec.describe 'vector.rb' do
  let(:data_vec_empty){::Vector[]}
  let(:data_vec₁_zero){::Vector[0]}

  context 'functionality' do
    context 'func{∅?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(::Vector[].∅?).to eq(true)
        end
        it 'cases: negative' do
          expect(::Vector[-1].∅?).to eq(false)
          expect(::Vector[-1.0].∅?).to eq(false)
          expect(data_vec₁_zero.∅?).to eq(false)
          expect(::Vector[0.0].∅?).to eq(false)
          expect(::Vector[1].∅?).to eq(false)
          expect(::Vector[1.0].∅?).to eq(false)
          expect(::Vector[-1337, 0, 1337.1337].∅?).to eq(false)
        end
      end
    end
  end

  context 'audit', :audit do
    context 'vector.rb passes audits' do
      it 'module is defined in correct location' do
        expect_∃ᶜ(:Vector)
      end
      context 'needed funcs are defined in expected location' do
        it 'for c{Matrix}' do
          expect_∃⨍(:∅?, ::Vector)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'func{∅?}' do
      context 'handles needed scenarios, extremely quickly' do
        it 'cases: positive' do
          expect{data_vec_empty.∅?}.to perform_extremely_quickly
        end
        it 'cases: negative' do
          expect{data_vec₁_zero.∅?}.to perform_extremely_quickly
        end
      end
    end
  end

end
