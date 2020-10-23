# frozen_string_literal: true

##
# The WebpagesDirector runs the show for the 'webpages_rating' command
class WebpagesDirector < Director
  SYMBOL_REGEX = %r{\A(?<symbol>\/[a-z\_]+(\/\d+)?)\s}.freeze
  PRINT_DETAILS = { header: 'webpages_rating', line_postfix: 'visits' }.freeze

  private

  def act
    FileParser.build(file_path: file_path, collector: collector, symbol_regex: SYMBOL_REGEX).parse
    lines = Grouper.build(method: :by_visits).group(collector.members)
    Sorter.new(arttibute: :amount).sort(lines)
    Presenter.new(**PRINT_DETAILS).prints(lines: lines)
  end
end
