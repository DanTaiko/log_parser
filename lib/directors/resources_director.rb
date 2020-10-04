# frozen_string_literal: true

##
# The ResourcesDirector runs the show for the 'resources_rating' command
class ResourcesDirector < WebpagesDirector
  PRINT_DETAILS = { header: 'resources_rating', line_postfix: 'visits' }.freeze

  private

  def act
    FileParser.build(file_path: file_path, collector: collector, symbol_regex: SYMBOL_REGEX).parse
    lines = Grouper.build(method: :by_resource).group(collector.members)
    Sorter.new(arttibute: :amount).sort(lines)
    Presenter.new(**PRINT_DETAILS).prints(lines: lines)
  end
end
