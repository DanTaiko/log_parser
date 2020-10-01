# frozen_string_literal: true

##
# The collector hold the objects and able to add new symbol and to unify objects.
class Collector
  attr_reader :members

  def initialize(builder:) end

  def add(symbol) end

  def unify() end
end
