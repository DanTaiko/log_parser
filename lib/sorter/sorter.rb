# frozen_string_literal: true

##
# The Sorter sorts out the lines
class Sorter
  def self.act(lines)
    lines.sort { |one, two| two.visits <=> one.visits }
  end
end
