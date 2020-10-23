# frozen_string_literal: true

##
# The VisitsGrouper groups collection by visits.
class VisitsGrouper < Grouper
  def group(collection)
    collection.group_by(&:title).each_with_object([]) do |(title, symbol_members), members|
      members << builder.new(symbol: title, amount: symbol_members.count)
    end
  end
end
