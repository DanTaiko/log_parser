# frozen_string_literal: true

##
# The Presenter prints out the lines
class Presenter
  attr_reader :header, :line_postfix

  def initialize(header: nil, line_postfix: nil)
    @header = header
    @line_postfix = line_postfix
  end

  def prints(lines:)
    print_header
    lines.each { |line| puts line.to_s(postfix: line_postfix) }
  end

  private

  def print_header
    puts("=== #{header} ===") if header
  end
end
