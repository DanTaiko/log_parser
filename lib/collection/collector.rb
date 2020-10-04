# frozen_string_literal: true

##
# The collector hold the objects and able to add new symbol and to unify objects.
class Collector
  attr_reader :builder, :members

  def initialize(builder:)
    @builder = builder
    @members = []
    LineBuilderValidator.new(builder: builder).check_with_error
  end

  def add(symbol, title = nil)
    @members << builder.new(symbol: symbol, title: title)
  end

  def unify
    @members = @members.group_by(&:symbol).each_with_object([]) do |(symbol, symbol_members), new_members|
      new_members << builder.new(symbol: symbol, amount: symbol_members.count)
    end
  end
end
