# frozen_string_literal: true

require 'spec_helper_v1'

describe 'FileParser' do
  before(:all) do
    @file_path = 'spec/fixtures/files/webserver.log'
    @file_data = File.read(@file_path).split("\n").map { |line| line.split[0] }
    @symbol_regex = %r{\A(?<symbol>(\/[a-z\_]+)(\/\d+)?)\s}.freeze
    @collector = []
    def @collector.add(symbol)
      self << symbol
    end
  end

  let(:parser) { FileParser.build(file_path: @file_path, collector: @collector, symbol_regex: @symbol_regex) }

  context 'parse' do
    it 'collect symbols in collection.' do
      parser.parse
      expect(@collector).to eq @file_data
    end
    it 'call the line_parser for each file line.' do
      expect(parser.line_parser).to receive(:find_symbol).exactly(@file_data.count).time
      parser.parse
    end
  end
end
