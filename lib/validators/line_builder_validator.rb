# frozen_string_literal: true

##
# The LineBuilderValidator validates that the builder could create Line
class LineBuilderValidator
  attr_reader :builder

  def initialize(builder:)
    @builder = builder
  end

  def check_with_error
    builder.new(symbol: 'symbol', amount: 5)
    true
  rescue NoMethodError
    raise(ArgumentError, 'The builder can not initiate an object.')
  rescue ArgumentError
    raise(ArgumentError, 'The builder can not initiate an object with the "symbol" and "amount" attributes.')
  end
end
