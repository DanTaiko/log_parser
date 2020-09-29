# frozen_string_literal: true

##
# The Presenter prints out the sorted lines
class Presenter
  def self.act(lines)
    puts "=== #{lines.first.class::HEADER} ==="
    lines.each { |line| puts line.print }
  end
end
