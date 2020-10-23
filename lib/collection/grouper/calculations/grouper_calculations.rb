# frozen_string_literal: true

##
# The GrouperCalculations make some calculations for a grouper.
class GrouperCalculations
  class << self
    def find_avagare_views(lines)
      views = lines.count
      uniq_views = lines.map(&:symbol).uniq.count
      (views / uniq_views.to_f).round(2)
    end
  end
end
