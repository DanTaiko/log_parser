# frozen_string_literal: true

##
# The Line is an object with symbol and amount.
class Line
  attr_reader :symbol, :amount

  def initialize(symbol:, amount: 1)
    @symbol = symbol
    @amount = amount
  end

  def to_s(postfix: nil)
    [symbol, amount, postfix].compact.join(' ')
  end
end
