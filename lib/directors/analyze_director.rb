# frozen_string_literal: true

##
# The AnalyzeDirector runs the show for the 'analyze' command
class AnalyzeDirector < WebpagesDirector
  SYMBOL_REGEX = %r{\A(?<symbol>\/[a-z\_]+(\/\d+)?)\s}.freeze
  PRINT_DETAILS = { header: 'unique_webpages_rating', line_postfix: 'unique views' }.freeze
end
