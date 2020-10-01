# frozen_string_literal: true

##
# The Presenter prints out the sorted lines
class Presenter
  attr_reader :lines

  def initialize(lines:) end

  def puts(header:, line_postfix:) end
end
