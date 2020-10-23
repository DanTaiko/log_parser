# frozen_string_literal: true

##
# The ResourcesDirector runs the show for the 'resources_rating' command
class ResourcesDirector < Director
  SYMBOL_REGEX = %r{\A(?<symbol>\/[a-z\_]+(\/\d+)?)\s}.freeze
  PRINT_DETAILS = { header: 'resources_rating', line_postfix: 'visits' }.freeze

  private

  def act
    FileParser.build(file_path: file_path, collector: collector, symbol_regex: SYMBOL_REGEX).parse
    lines = Grouper.build(method: :by_resource).group(collector.members)
    Sorter.new(arttibute: :amount).sort(lines)
    Presenter.new(**PRINT_DETAILS).prints(lines: lines)
  end
end
