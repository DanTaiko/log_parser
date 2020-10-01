# frozen_string_literal: true

##
# The FilePresenceValidator checks if a file exist
class FilePresenceValidator
  FILE_REGEXP = %r{(\.{0,2}\/)?([a-zA-Z_]+\/)*([a-zA-Z_]+)\.log}.freeze

  attr_reader :file_path, :err_message

  def initialize(file_path:)
    @file_path = file_path
    @err_message = nil
  end

  def valid?
    @err_message = if !file_path.match?(FILE_REGEXP)
                     'The log file has a file extension other than ".log".'
                   elsif !File.file?(file_path)
                     'The log file is missing.'
                   end
    !@err_message
  end
end
