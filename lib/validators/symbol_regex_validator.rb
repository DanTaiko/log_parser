# frozen_string_literal: true

##
# The SymbolRegexValidator validates regex with a symbol capture
class SymbolRegexValidator
  attr_reader :symbol_regex

  def initialize(symbol_regex:)
    @symbol_regex = symbol_regex
  end

  def valid?
    symbol_regex.is_a?(Regexp) && symbol_regex.named_captures.key?('symbol')
  end
end
