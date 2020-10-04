# frozen_string_literal: true

##
# The LineParser get a log line and get the line symbol.
class LineParser
  attr_reader :symbol_regex, :title_regex

  def initialize(symbol_regex:, title_regex: nil)
    @symbol_regex = symbol_regex
    @title_regex = title_regex
    validate_regexs
  end

  def find_symbol(file_line:)
    find(file_line: file_line, symbol: :symbol)
  end

  def find_title(file_line:)
    find(file_line: file_line, symbol: :title) if title_regex
  end

  def find_symbol_and_title(file_line:)
    [find_symbol(file_line: file_line), find_title(file_line: file_line)]
  end

  private

  def find(file_line:, symbol: :symbol)
    raise(ArgumentError, 'The file_line is not a string.') unless file_line.is_a?(String)

    regex = send("#{symbol}_regex")
    raise(ArgumentError, 'The file_line misses the symbol.') unless file_line.match?(regex)

    file_line.match(regex)[symbol]
  end

  def validate_regexs
    validate_regex_for('symbol')
    validate_regex_for('title') if title_regex
  end

  def validate_regex_for(attr = 'symbol')
    regex = send("#{attr}_regex")
    validator = SymbolRegexValidator.new(symbol_regex: regex, symbol_attr: attr)
    raise(ArgumentError, "The #{attr}_regex is invalid.") unless validator.valid?
  end
end
