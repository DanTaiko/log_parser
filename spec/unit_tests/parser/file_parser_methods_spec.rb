# frozen_string_literal: true

require 'spec_helper'

describe 'FileParser' do
  before(:all) do
    @file_path = 'spec/fixtures/files/webserver.log'
    @file_data = File.read(@file_path).split("\n").map { |line| line.split[0] }
    @symbol_regex = %r{\A(?<symbol>[\w\.\/]+)\s}.freeze
    @title_regex = /\s(?<title>[\w\.]+)$/.freeze
    @collector = Collector.new(builder: Line)
  end

  let(:parser) do
    FileParser.build(file_path: @file_path,
                     collector: @collector,
                     symbol_regex: [@symbol_regex, @title_regex])
  end

  context 'parse' do
    it 'collect symbols in collection.' do
      parser.parse
      expect(@collector.members.map(&:symbol)).to eq @file_data
    end
    it 'call the line_parser for each file line.' do
      expect(parser.line_parser).to receive(:find_symbol).exactly(@file_data.count).time
      parser.parse
    end
  end
end
