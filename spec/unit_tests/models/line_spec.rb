# frozen_string_literal: true

require 'spec_helper'

describe 'Line' do
  let(:symbol) { 'symbol' }

  context 'initialization' do
    it 'with symbol' do
      line = Line.new(symbol: symbol)
      expect(line.symbol).to eq symbol
      expect(line.amount).to eq 1
    end

    it 'with symbol and amount' do
      line = Line.new(symbol: symbol, amount: 10)
      expect(line.symbol).to eq symbol
      expect(line.amount).to eq 10
    end

    it 'fails without symbol' do
      expect { Line.new }.to raise_error(ArgumentError)
    end
  end

  context 'to_s' do
    let(:line) { Line.new(symbol: symbol) }

    it 'gives a meaningful string' do
      expect(line.to_s).to eq "#{symbol} 1"
    end

    it 'with postfix' do
      expect(line.to_s(postfix: 'postfix')).to eq "#{symbol} 1 postfix"
    end
  end
end
