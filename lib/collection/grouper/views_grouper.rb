# frozen_string_literal: true

##
# The ViewsGrouper groups collection by views.
class ViewsGrouper < Grouper
  def group(collection)
    collection.group_by(&:title).each_with_object([]) do |(title, symbol_members), members|
      members << builder.new(symbol: title,
                             amount: symbol_members.map(&:symbol).uniq.count)
    end
  end
end
