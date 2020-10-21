# frozen_string_literal: true

##
# The Grouper is abstract class that initiates a concrete grouper.
class Grouper
  GROUPERS = {
    by_visits: 'VisitsGrouper',
    by_uniq_views: 'ViewsGrouper',
    by_resource: 'ResourceGrouper',
    by_average: 'AverageGrouper'
  }.freeze

  attr_reader :builder

  def initialize(builder: Line)
    raise(NotImplementedError, 'Use Grouper.build to initiate a new grouper.') if self.class == Grouper

    @builder = builder
    LineBuilderValidator.new(builder: builder).check_with_error
  end

  def self.build(method:, builder: Line)
    grouper = GROUPERS[method.to_sym]
    raise(NotImplementedError) unless grouper

    Object.const_get(grouper).new(builder: builder)
  end

  # This method definition is only for the sake of interface description.
  def group
    raise(NotImplementedError)
  end
end
