# frozen_string_literal: true

require 'spec_helper'

describe 'LineParser' do
  before(:all) do
    @file_line = 'symbol 111.222.333.444'
    @symbol_regex = /\A(?<symbol>\w+)/
  end

  let(:parser) { LineParser.new(symbol_regex: @symbol_regex) }

  context 'find_symbol' do
    it 'fails without file_line' do
      expect { parser.find_symbol }.to raise_error(ArgumentError)
    end

    it 'fails with a bad file_line' do
      expect { parser.find_symbol(file_line: 123) }.to raise_error(ArgumentError)
    end

    it 'fails for the line without symbol' do
      expect { parser.find_symbol(file_line: '') }.to raise_error(ArgumentError)
    end

    it 'return the founded sysbol' do
      expect(parser.find_symbol(file_line: @file_line)).to eq 'symbol'
    end
  end
end
