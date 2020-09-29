# frozen_string_literal: true

##
# The UniqParser parse a file and generates the lines for the uniq paths
class UniqParser < Parser
  BUILDER = UniqPrintLine
  PATH_REGEXP = %r{\A(\/[a-z\_]+(\/\d+)?)\s}.freeze
end
