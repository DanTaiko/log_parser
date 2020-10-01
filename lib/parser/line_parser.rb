# frozen_string_literal: true

##
# The LineParser get a log line and get the line symbol.
class LineParser
  attr_reader :symbol_regex

  def initialize(symbol_regex:)
    @symbol_regex = symbol_regex
    validate_symbol_regex
  end

  def find_symbol(file_line:)
    raise(ArgumentError, 'The file_line is not a string.') unless file_line.is_a?(String)

    raise(ArgumentError, 'The file_line misses the symbol.') unless file_line.match?(symbol_regex)

    file_line.match(symbol_regex)[:symbol]
  end

  private

  def validate_symbol_regex
    return if SymbolRegexValidator.new(symbol_regex: symbol_regex).valid?

    raise(ArgumentError, 'The symbol_regex is invalid.')
  end
end
