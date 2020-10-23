# frozen_string_literal: true

##
# The AnalyzeDirector runs the show for the 'analyze' command
class AnalyzeDirector < Director
  URL_REGEX = %r{\A(?<title>\/[a-z\_]+(\/\d+)?)\s}.freeze
  IP_REGEX = /(?<symbol>\d{1,3}(\.\d{1,3}){3})$/.freeze

  private

  def act
    members = FileParser.build(file_path: file_path,
                               collector: collector,
                               symbol_regex: [IP_REGEX, URL_REGEX]).parse
    presenter = AnalyzeDirectorPresenter.new(members: members)
    presenter.by_visits
    presenter.by_uniq_views
  end
end
