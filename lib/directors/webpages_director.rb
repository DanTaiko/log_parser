# frozen_string_literal: true

##
# The WebpagesDirector runs the show for the 'webpages_rating' command
class WebpagesDirector
  SYMBOL_REGEX = %r{\A(?<symbol>\/[a-z\_]+(\/\d+)?)\s}.freeze
  PRINT_DETAILS = { header: 'webpages_rating', line_postfix: 'visits' }.freeze

  attr_reader :file_path

  def initialize(file_path:, collector:)
    @file_path = file_path
    @collector = collector
  end

  def self.build(file_path:, builder: Line)
    new(file_path: file_path, collector: Collector.new(builder: builder))
  end

  def validate_and_act
    file_validator = FilePresenceValidator.new(file_path: file_path)
    raise(ArgumentError, file_validator.err_message) unless file_validator.valid?

    act
  end

  private

  attr_reader :collector

  def act
    FileParser.build(file_path: file_path, collector: collector, symbol_regex: SYMBOL_REGEX).parse
    lines = Grouper.build(method: :by_visits).group(collector.members)
    Sorter.new(arttibute: :amount).sort(lines)
    Presenter.new(**PRINT_DETAILS).prints(lines: lines)
  end
end
