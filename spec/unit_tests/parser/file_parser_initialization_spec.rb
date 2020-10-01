# frozen_string_literal: true

require 'spec_helper'

describe 'FileParser' do
  before(:all) do
    @symbol_regex = /\A(?<symbol>\w+)/
    @collector = Struct.new(:builder) do
      def add(*) end
    end.new
  end

  let(:parser) { FileParser.build(file_path: 'file_path', collector: @collector, symbol_regex: @symbol_regex) }

  context 'initialization' do
    it 'keeping the symbol_regex and file_path.' do
      expect(parser.file_path).to eq 'file_path'
      expect(parser.line_parser).to be_a(LineParser)
      expect(parser.line_parser.symbol_regex).to eq @symbol_regex
    end

    it 'fails without symbol_regex' do
      expect { LineParser.new }.to raise_error(ArgumentError)
    end

    it 'fails with a invalid collector' do
      params = { file_path: 'file_path', collector: 'collector', symbol_regex: @symbol_regex }
      expect { FileParser.new(**params) }.to raise_error(ArgumentError)
    end

    it 'fails if collector can not add the symbol' do
      params = { file_path: 'file_path', collector: [], symbol_regex: @symbol_regex }
      expect { FileParser.new(**params) }.to raise_error(ArgumentError)
    end
  end
end
