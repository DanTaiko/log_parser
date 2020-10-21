# frozen_string_literal: true

##
# The AverageDirector runs the show for the 'average_rating' command
class AverageDirector < WebpagesDirector
  URL_REGEX = %r{\A(?<title>\/[a-z\_]+(\/\d+)?)\s}.freeze
  IP_REGEX = /(?<symbol>\d{1,3}(\.\d{1,3}){3})$/.freeze
  PRINT_DETAILS = { header: 'average_rating', line_postfix: 'average page views' }.freeze

  private

  def act
    members = FileParser.build(file_path: file_path,
                               collector: collector,
                               symbol_regex: [IP_REGEX, URL_REGEX]).parse
    lines = Grouper.build(method: :by_average).group(members)
    Sorter.new(arttibute: :amount).sort(lines)
    Presenter.new(**PRINT_DETAILS).prints(lines: lines)
  end
end
