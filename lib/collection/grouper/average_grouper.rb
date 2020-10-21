# frozen_string_literal: true

##
# The AverageGrouper groups collection by avarage views.
class AverageGrouper < Grouper
  def group(collection)
    collection.group_by(&:title).each_with_object([]) do |(title, symbol_members), members|
      views = symbol_members.count
      uniq_views = symbol_members.map(&:symbol).uniq.count
      members << builder.new(symbol: title,
                             amount: (views / uniq_views.to_f).round(2))
    end
  end
end
