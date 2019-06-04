require_relative '../../lib/matrix'
require 'spec_helper'

RSpec.describe 'Helper' do
  describe 'initialize' do

    before do
      @matrix = Matrix.new
      allow($stdin).to receive(:gets).and_return('3x2')
      @matrix.height, @matrix.width = $stdin.gets.downcase.chomp.split('x').map(&:to_i)
      @matrix.count = @matrix.height * @matrix.width

      allow($stdin).to receive(:gets).and_return('M')
      @matrix.operator = Matrix::OPERATORS[$stdin.gets.upcase.chomp]

      allow($stdin).to receive(:gets).and_return('F')
      @matrix.operation = $stdin.gets.upcase.chomp

      @matrix.arr = []
    end

    context 'Generate Prime Number' do
      it 'should array of prime numbers' do
        expect(@matrix.operation_p).to eq([2, 3, 5])
      end
    end

    context 'Generate Fibonacci Number' do
      it 'should array of fibonacci numbers' do
        expect(@matrix.operation_f).to eq([[1, 1, 2, 3, 5, 8], [1, 1, 2, 3, 5, 8], [1, 1, 2, 3, 5, 8], [1, 1, 2, 3, 5, 8], [1, 1, 2, 3, 5, 8], [1, 1, 2, 3, 5, 8]])
      end
    end

  end
end