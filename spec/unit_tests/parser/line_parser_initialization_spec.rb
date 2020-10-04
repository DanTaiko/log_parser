# frozen_string_literal: true

require 'spec_helper'

describe 'LineParser initialization' do
  before(:all) do
    # file_line: 'symbol title'
    @symbol_regex = /\A(?<symbol>\w+)/
    @title_regex = /(?<title>\w+)\z/
  end

  let(:parser) { LineParser.new(symbol_regex: @symbol_regex, title_regex: @title_regex) }

  it 'keeping the symbol_regex and title_regex values' do
    expect(parser.symbol_regex).to eq @symbol_regex
    expect(parser.title_regex).to eq @title_regex
  end

  it 'fails without symbol_regex' do
    expect { LineParser.new }.to raise_error(ArgumentError)
  end

  it 'pass without title_regex' do
    expect { LineParser.new(symbol_regex: @symbol_regex) }.not_to raise_error
  end
end

describe 'LineParser validation' do
  before(:all) do
    # file_line: 'symbol title'
    @symbol_regex = /\A(?<symbol>\w+)/
    @title_regex = /(?<title>\w+)\z/
  end

  context 'for symbol_regex' do
    it 'fails with symbol_regex that is missing a "symbol" named_captures' do
      regex = /\w+/
      expect { LineParser.new(symbol_regex: regex) }.to raise_error(ArgumentError)
    end

    it 'fails with a bad symbol_regex' do
      expect { LineParser.new(symbol_regex: 'symbol_regex') }.to raise_error(ArgumentError)
    end
  end

  context 'for title_regex' do
    it 'fails with title_regex that is missing a "title" named_captures' do
      regex = /\w+/
      expect { LineParser.new(symbol_regex: @symbol_regex, title_regex: regex) }.to raise_error(ArgumentError)
    end

    it 'fails with a bad title_regex' do
      expect { LineParser.new(symbol_regex: @symbol_regex, title_regex: 'title_regex') }.to raise_error(ArgumentError)
    end
  end
end
