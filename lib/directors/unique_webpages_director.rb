# frozen_string_literal: true

##
# The UniqueWebpagesDirector runs the show for the 'unique_webpages_rating' command
class UniqueWebpagesDirector < WebpagesDirector
  SYMBOL_REGEX = %r{\A(?<symbol>\/[a-z\_]+(\/\d+)?)\s}.freeze
  PRINT_DETAILS = { header: 'unique_webpages_rating', line_postfix: 'unique views' }.freeze
end
