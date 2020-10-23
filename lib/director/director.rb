# frozen_string_literal: true

##
# The Director is abstract class that initiates a concrete director.
class Director
  attr_reader :file_path

  def initialize(file_path:, collector:)
    @file_path = file_path
    @collector = collector
  end

  def self.build(file_path:, builder: Line)
    new(file_path: file_path, collector: Collector.new(builder: builder))
  end

  def validate_and_act
    file_validator = FilePresenceValidator.new(file_path: file_path)
    raise(ArgumentError, file_validator.err_message) unless file_validator.valid?

    act
  end

  private

  attr_reader :collector

  # This method definition is only for the sake of interface description.
  def act
    raise(NotImplementedError)
  end
end
