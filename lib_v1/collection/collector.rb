# frozen_string_literal: true

##
# The collector hold the objects and able to add new symbol and to unify objects.
class Collector
  attr_reader :builder, :members

  def initialize(builder:)
    @builder = builder
    validate_builder
    @members = []
  end

  def add(symbol)
    @members << builder.new(symbol: symbol)
  end

  def unify
    @members = @members.group_by(&:symbol).each_with_object([]) do |(symbol, symbol_members), new_members|
      new_members << builder.new(symbol: symbol, amount: symbol_members.count)
    end
  end

  private

  def validate_builder
    builder.new(symbol: 'symbol', amount: 5)
  rescue NoMethodError
    raise(ArgumentError, 'The builder can not initiate an object.')
  rescue ArgumentError
    raise(ArgumentError, 'The builder can not initiate an object with the "symbol" and "amount" attributes.')
  end
end
