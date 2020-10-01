# frozen_string_literal: true

##
# The FileParser load a file and pass each line to LineParse, then feed the symbol the collector.
class FileParser
  attr_reader :file_path, :line_parser

  def initialize(file_path:, collector:, line_parser:)
    @file_path = file_path
    @collector = collector
    @line_parser = line_parser
  end

  def self.build(file_path:, collector:, symbol_regex:)
    new(file_path: file_path, collector: collector, line_parser: LineParser.new(symbol_regex: symbol_regex))
  end

  def parse
    File.foreach(file_path) do |line|
      symbol = line_parser.find_symbol(file_line: line)
      add_to_collection(symbol)
    end
  end

  private

  def add_to_collection(symbol)
    @collector.add(symbol)
  rescue NoMethodError
    raise(ArgumentError, 'The collector can not add an symbol.')
  rescue ArgumentError
    raise(ArgumentError, 'The collector\'s "add" method is invalid.')
  end
end
