require_relative '../../lib/matrix'
require 'spec_helper'

RSpec.describe 'Matrix' do
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

    context 'given user inputs are correct' do
      context 'matrix dimention (<width>x<height>)' do

        it 'should number (height)' do
          expect(@matrix.height).to be_kind_of(Numeric)
        end

        it 'should number (width)' do
          expect(@matrix.width).to be_kind_of(Numeric)
        end
          
      end

      context '(M)ultiplication (*) or (A)ddition (+)' do
        
        it 'should * or +' do
          expect(['*', '+']).to include(@matrix.operator)
        end

      end

      context 'Should I use (P)rime numbers or (F)ibonacci numbers?' do
        it 'should P or F' do
          expect(['P', 'F']).to include(@matrix.operation)
        end        
      end
    end

  end
end