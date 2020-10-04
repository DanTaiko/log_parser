# frozen_string_literal: true

APP_ROOT = './lib/'

require "#{APP_ROOT}models/line"
require "#{APP_ROOT}collection/collector"
require "#{APP_ROOT}collection/sorter"
require "#{APP_ROOT}validators/file_presence_validator"
require "#{APP_ROOT}validators/symbol_regex_validator"
require "#{APP_ROOT}validators/line_builder_validator"
require "#{APP_ROOT}parser/file_parser"
require "#{APP_ROOT}parser/line_parser"
require "#{APP_ROOT}presenter/presenter"
require "#{APP_ROOT}directors/webpages_director"
require "#{APP_ROOT}directors/unique_webpages_director"
require "#{APP_ROOT}collection/grouper/grouper"
require "#{APP_ROOT}collection/grouper/visits_grouper"
require "#{APP_ROOT}collection/grouper/views_grouper"
require "#{APP_ROOT}collection/grouper/resource_grouper"

##
# The LogParcer acts as the app configuration.
class LogParcer
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
  end

  def webpages_rating
    WebpagesDirector.build(file_path: @file_path).validate_and_act
  end

  def unique_webpages_rating
    UniqueWebpagesDirector.build(file_path: @file_path).validate_and_act
  end
end
