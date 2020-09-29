# frozen_string_literal: true

##
# The FileValidator checks if a file exist
class FileValidator
  FILE_REGEXP = %r{(\.{0,2}\/)?([a-zA-Z_]+\/)*([a-zA-Z_]+)\.log}.freeze

  # MissingFile happend if the log file missing
  MissingFile = Class.new(RuntimeError)

  # InvalidFileExtention happend if the file has invalid extention
  InvalidFileExtention = Class.new(RuntimeError)

  def self.act(file_path)
    raise(InvalidFileExtention, "file_path: #{file_path}") unless file_path.match?(FILE_REGEXP)
    raise(MissingFile, "file_path: #{file_path}") unless File.file?(file_path)

    file_path
  end
end
