# frozen_string_literal: true

##
# The AnalyzeDirectorPresenter groups, sorts and presents lines for AnalyzeDirector.
class AnalyzeDirectorPresenter
  DETAILS = { by_visits: { header: 'webpages_rating_by_visits',
                           line_postfix: 'visits' },
              by_uniq_views: { header: 'webpages_rating_by_views',
                               line_postfix: 'unique views' } }.freeze

  attr_reader :members

  def initialize(members:)
    @members = members
  end

  def by_visits
    present(__method__)
  end

  def by_uniq_views
    present(__method__)
  end

  private

  def present(method)
    lines = Grouper.build(method: method).group(members)
    Sorter.new(arttibute: :amount).sort(lines)
    Presenter.new(DETAILS[method]).prints(lines: lines)
  end
end
