# frozen_string_literal: true

##
# The ResourceGrouper groups collection by resources.
class ResourceGrouper < Grouper
  def group(collection)
    groups = collection.group_by do |member|
      member.title.sub(%r{(\/\d?)?$}, '')
    end
    groups.each_with_object([]) do |(title, symbol_members), members|
      members << builder.new(symbol: title, amount: symbol_members.count)
    end
  end
end
