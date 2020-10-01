# frozen_string_literal: true

##
# The FileParser load a file and pass each line to LineParse, then feed the symbol the collector.
class FileParser
  attr_reader :file_path
  attr_reader :symbol_regex

  def initialize(file_path:, collector:, symbol_regex:) end

  def parse() end
end
