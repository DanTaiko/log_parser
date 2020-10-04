# frozen_string_literal: true

require 'spec_helper'

describe 'SymbolRegexValidator initialization' do
  before(:all) do
    @symbol_attr = 'symbol'
    @symbol_regex = /\A(?<symbol>\w+)/
  end

  let(:validator) { SymbolRegexValidator.new(symbol_regex: @symbol_regex, symbol_attr: symbol_attr) }

  it 'keeping the symbol_regex value' do
    expect(validator.symbol_regex).to eq @symbol_regex
  end

  it 'keeping the symbol_attr value' do
    expect(validator.symbol_attr).to eq @symbol_attr
  end

  it 'fails without symbol_regex' do
    expect { SymbolRegexValidator.new }.to raise_error(ArgumentError)
  end

  it 'pass without symbol_attr' do
    expect { SymbolRegexValidator.new(symbol_regex: @symbol_regex) }.not_to raise_error
  end
end

describe 'SymbolRegexValidator#valid?' do
  before(:all) do
    @symbol_attr = 'symbol'
    @symbol_regex = /\A(?<symbol>\w+)/
  end

  let(:validator) { SymbolRegexValidator.new(symbol_regex: @symbol_regex, symbol_attr: symbol_attr) }

  it 'pass for valid regex' do
    expect(validator.valid?).to be_falsey
  end

  it 'fails with symbol_regex that is missing a "symbol" named_captures' do
    regex = /\w+/
    validator = SymbolRegexValidator.new(symbol_regex: regex)
    expect(validator.valid?).to be_falsey
  end

  it 'fails with a bad symbol_regex' do
    regex = 'symbol_regex'
    validator = SymbolRegexValidator.new(symbol_regex: regex)
    expect(validator.valid?).to be_falsey
  end

  it 'fails with symbol_regex that is missing a "title" named_captures' do
    validator = SymbolRegexValidator.new(symbol_regex: @symbol_regex, symbol_attr: 'title')
    expect(validator.valid?).to be_falsey
  end
end
