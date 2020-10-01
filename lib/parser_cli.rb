# frozen_string_literal: true

require 'thor'
require './lib/log_parser.rb'

##
# The basic CLI to the Parser
#
# = Command examples
#
# webpages_rating::  list of the webpages with most page views ordered
#                    from most pages views to less page views
#                      $ bin/parser webpages_rating webserver.log
#
# unique_webpages_rating::  list of webpages with most unique page views ordered
#                           from most pages views to less page views
#                             $ bin/parser unique_webpages_rating webserver.log
#
class ParserCLI < Thor
  desc 'webpages_rating PATH/TO/FILE', 'list of webpages with most page views'
  long_desc <<-LONGDESC
    This command will parse a logfile and list of the webpages with most page views ordered from most pages views to less page views.

    > $ bin/parser webpages_rating webserver.log

  LONGDESC
  def webpages_rating(path)
    LogParcer.new(file_path: path).send(__method__)
  end

  desc 'unique_webpages_rating PATH/TO/FILE', 'list of unique webpages with most page views'
  long_desc <<-LONGDESC
    This command will parse a logfile and list of webpages with most unique page views ordered.

    > $ bin/parser unique_webpages_rating webserver.log

  LONGDESC
  def unique_webpages_rating(path)
    LogParcer.new(file_path: path).send(__method__)
  end

  def self.exit_on_failure?
    true
  end
end

ParserCLI.start(ARGV)
