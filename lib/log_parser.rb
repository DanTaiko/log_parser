# frozen_string_literal: true

Dir[Dir.pwd + '/lib/**/*.rb'].sort.each { |f| require f }

##
# The LogParcer acts as the app configuration.
class LogParcer
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
  end

  def analyze
    AnalyzeDirector.build(file_path: @file_path).validate_and_act
  end

  def average_rating
    AverageDirector.build(file_path: @file_path).validate_and_act
  end

  def resources_rating
    ResourcesDirector.build(file_path: @file_path).validate_and_act
  end

  def webpages_rating
    WebpagesDirector.build(file_path: @file_path).validate_and_act
  end
end
