# encoding: UTF-8

# `f98_b02`
RSpec.describe 'f98_b02' do
  context 'feature{f98} functionality for' do
    context 'behavior{b02}' do
      context 'loads needed Ruby libraries' do
        it 'singleton' do
          expect(require('singleton')).to eq(false)
        end
        it 'time' do
          expect(require('time')).to eq(false)
        end
        context 'web protocols' do
          it 'net/http' do
            expect(require('net/http')).to eq(false)
          end
          it 'socket' do
            expect(require('socket')).to eq(false)
          end
        end
        context 'i/o related' do
          it 'logger' do
            expect(require('logger')).to eq(false)
          end
          it 'pretty print' do
            expect(require('pp')).to eq(false)
          end
        end
        context 'math related' do
          it 'bigdecimal' do
            expect(require('bigdecimal')).to eq(false)
          end
        end
      end # end: {loads needed Ruby libraries}
      context 'loads needed 3ʳᵈ party libraries' do
        it 'tty-command' do
          expect(require('tty-command')).to eq(false)
        end
      end # end: {loads needed 3ʳᵈ party libraries}
    end
  end
end
