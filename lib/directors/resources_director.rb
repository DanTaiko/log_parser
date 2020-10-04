# frozen_string_literal: true

##
# The ResourcesDirector runs the show for the 'resources_rating' command
class ResourcesDirector < WebpagesDirector
  SYMBOL_REGEX = %r{\A(?<symbol>\/[a-z\_]+)(\/\d+)?\s}.freeze
  PRINT_DETAILS = { header: 'resources_rating', line_postfix: 'visits' }.freeze
end
