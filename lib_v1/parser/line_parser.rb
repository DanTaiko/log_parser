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
    raise(ArgumentError, 'The symbol_regex is invalid.') unless symbol_regex.is_a?(Regexp)
    return if symbol_regex.named_captures.key?('symbol')

    raise(ArgumentError, 'The symbol_regex does not have the "symbol" capture.')
  end
end
