# frozen_string_literal: true

require 'spec_helper_v1'

describe 'LineParser' do
  before(:all) do
    @file_line = 'symbol 111.222.333.444'
    @symbol_regex = /\A(?<symbol>\w+)/
  end

  let(:parser) { LineParser.new(symbol_regex: @symbol_regex) }

  context 'initialization' do
    it 'keeping the symbol_regex value' do
      expect(parser.symbol_regex).to eq @symbol_regex
    end

    it 'fails without symbol_regex' do
      expect { LineParser.new }.to raise_error(ArgumentError)
    end

    it 'fails with symbol_regex that is missing a "symbol" named_captures' do
      regex = /\w+/
      expect { LineParser.new(symbol_regex: regex) }.to raise_error(ArgumentError)
    end

    it 'fails with a bad symbol_regex' do
      expect { LineParser.new(symbol_regex: 'symbol_regex') }.to raise_error(ArgumentError)
    end
  end
end
