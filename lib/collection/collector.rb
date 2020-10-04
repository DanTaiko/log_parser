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
    title ||= symbol
    @members << builder.new(symbol: symbol, title: title)
  end
end
