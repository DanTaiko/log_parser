# frozen_string_literal: true

##
# The Line is an object with symbol and amount.
class Line
  attr_reader :symbol
  attr_accessor :amount

  def initialize(symbol:, amount: 1) end

  def to_s(postfix:) end
end
