# frozen_string_literal: true

##
# The SymbolRegexValidator validates regex with a symbol capture
class SymbolRegexValidator
  attr_reader :symbol_regex, :symbol_attr

  def initialize(symbol_regex:, symbol_attr: 'symbol')
    @symbol_regex = symbol_regex
    @symbol_attr = symbol_attr
  end

  def valid?
    symbol_regex.is_a?(Regexp) && symbol_regex.named_captures.key?(symbol_attr)
  end
end
