# frozen_string_literal: true

##
# The WebpagesDirector runs the show for the 'webpages_rating' command
class WebpagesDirector
  SYMBOL_REGEX = %r{\A(?<symbol>\/[a-z\_]+)(\/\d+)?\s}.freeze
  PRINT_DETAILS = { header: 'webpages_rating', line_postfix: 'visits' }.freeze

  attr_reader :file_path

  def initialize(file_path:, collector:)
    @file_path = file_path
    @collector = collector
    @class_ref = self.class
  end

  def self.build(file_path:, builder: Line)
    new(file_path: file_path, collector: Collector.new(builder: builder))
  end

  def validate_and_act
    file_validator = FilePresenceValidator.new(file_path: file_path)
    act and return if file_validator.valid?

    err_message = file_validator.err_message
    raise(ArgumentError, err_message) if err_message

    raise('The WebpagesDirector.act() ends up with an error.')
  end

  private

  def act
    FileParser.build(file_path: file_path, collector: @collector, symbol_regex: @class_ref::SYMBOL_REGEX).parse
    @collector.unify
    lines = @collector.members
    Sorter.new(arttibute: :amount).sort(lines)
    Presenter.new(**@class_ref::PRINT_DETAILS).prints(lines: lines)
  end
end