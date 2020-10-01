# frozen_string_literal: true

require 'spec_helper_v1'

describe 'SymbolRegexValidator' do
  before(:all) do
    @symbol_regex = /\A(?<symbol>\w+)/
  end

  let(:validator) { SymbolRegexValidator.new(symbol_regex: @symbol_regex) }

  context 'initialization' do
    it 'keeping the symbol_regex value' do
      expect(validator.symbol_regex).to eq @symbol_regex
    end

    it 'fails without symbol_regex' do
      expect { SymbolRegexValidator.new }.to raise_error(ArgumentError)
    end

    it 'fails with symbol_regex that is missing a "symbol" named_captures' do
      regex = /\w+/
      expect(SymbolRegexValidator.new(symbol_regex: regex).valid?).to be_falsey
    end

    it 'fails with a bad symbol_regex' do
      expect(SymbolRegexValidator.new(symbol_regex: 'symbol_regex').valid?).to be_falsey
    end
  end
end
