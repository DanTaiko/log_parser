# frozen_string_literal: true

##
# The printer line class
class PrintLine
  ATTR = %i[path_name visits].freeze
  attr_reader(ATTR.first)
  attr_accessor(*ATTR[1..-1])
  HEADER = 'webpages_rating'
  POSTFIX = 'visits'

  def initialize(*params)
    raise(ArgumentError, 'wrong params set') if ATTR.size != params.count

    ATTR.each_with_index do |param, index|
      instance_variable_set("@#{param}", params[index])
    end
  end

  def print
    [path_name, visits.to_s, self.class::POSTFIX].join(' ')
  end
end
