# frozen_string_literal: true

require 'spec_helper'

describe 'Line initialization' do
  let(:symbol) { 'symbol' }
  let(:amount) { 10 }
  let(:title) { 'title' }

  it 'with symbol' do
    line = Line.new(symbol: symbol)
    expect(line.symbol).to eq symbol
    expect(line.amount).to eq 1
  end

  it 'with symbol and amount' do
    line = Line.new(symbol: symbol, amount: amount)
    expect(line.symbol).to eq symbol
    expect(line.amount).to eq amount
  end

  it 'with symbol, amount and title' do
    line = Line.new(symbol: symbol, amount: amount, title: title)
    expect(line.symbol).to eq symbol
    expect(line.amount).to eq amount
    expect(line.title).to eq title
  end

  it 'fails without symbol' do
    expect { Line.new }.to raise_error(ArgumentError)
  end
end

describe 'Line#to_s' do
  let(:title) { 'title' }
  let(:line) { Line.new(symbol: 'symbol', title: title) }

  it 'gives a meaningful string' do
    expect(line.to_s).to eq "#{title} 1"
  end

  it 'with postfix' do
    expect(line.to_s(postfix: 'postfix')).to eq "#{title} 1 postfix"
  end
end
