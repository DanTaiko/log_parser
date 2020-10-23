# frozen_string_literal: true

##
# The AverageGrouper groups collection by avarage views.
class AverageGrouper < Grouper
  def group(collection)
    collection.group_by(&:title).each_with_object([]) do |(title, symbol_members), members|
      members << builder.new(symbol: title,
                             amount: GrouperCalculations.find_avagare_views(symbol_members))
    end
  end
end
