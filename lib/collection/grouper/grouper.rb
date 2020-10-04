# frozen_string_literal: true

##
# The Grouper is abstract class that initiates a concrete grouper.
class Grouper
  attr_reader :builder

  def initialize(builder: Line)
    raise(NotImplementedError, 'Use Grouper.build to initiate a new grouper.') if self.class == Grouper

    @builder = builder
    LineBuilderValidator.new(builder: builder).check_with_error
  end

  def self.build(method:, builder: Line)
    case method.to_sym
    when :by_visits
      VisitsGrouper
    when :by_uniq_views
      ViewsGrouper
    when :by_resource
      ResourceGrouper
    else
      raise(NotImplementedError)
    end.new(builder: builder)
  end

  def group
    raise(NotImplementedError)
  end
end
