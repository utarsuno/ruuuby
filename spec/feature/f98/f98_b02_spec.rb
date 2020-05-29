# coding: UTF-8

RSpec.describe 'f98_b00' do

  context 'feature{f98} functionality for' do
    context 'behavior{b02}' do

      context 'loads needed Ruby libraries' do

        it 'bigdecimal' do
          expect(require('bigdecimal')).to eq(false)
        end

        it 'tempfile' do
          expect(require('tempfile')).to eq(false)
        end

        it 'singleton' do
          expect(require('singleton')).to eq(false)
        end

        it 'logger' do
          expect(require('logger')).to eq(false)
        end

        it 'time' do
          expect(require('time')).to eq(false)
        end

        it 'prime' do
          expect(require('prime')).to eq(false)
        end

      end
    end
  end

end
