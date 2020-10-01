# frozen_string_literal: true

##
# The LineParser get a log line and get the line symbol.
class LineParser
  attr_reader :file_line
  attr_reader :symbol_regex

  def initialize(file_line:, symbol_regex:) end

  def find_symbol() end
end
