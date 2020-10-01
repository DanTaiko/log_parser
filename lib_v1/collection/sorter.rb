# frozen_string_literal: true

##
# The Sorter sorts the collection by an member arttibute in the DESC order.
class Sorter
  attr_reader :arttibute

  def initialize(arttibute:)
    @arttibute = arttibute
  end

  def sort(collection)
    collection.sort! { |one, two| two.send(arttibute) <=> one.send(arttibute) }
  end
end
