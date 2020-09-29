# frozen_string_literal: true

##
# The Parser parse a file and generates the lines
class Parser
  BUILDER = PrintLine
  PATH_REGEXP = %r{\A(\/[a-z\_]+)(\/\d+)?\s}.freeze

  # InvalidLogFormat happend if the log file invalid
  InvalidLogFormat = Class.new(RuntimeError)

  class << self
    def act(file_path)
      File.foreach(file_path).with_object({}) do |line, the_lines|
        params = line.match(self::PATH_REGEXP)
        raise(InvalidLogFormat, "Invalid line: #{line}") unless params

        add_line(the_lines, params[1])
      end.values
    end

    private

    def add_line(the_lines, path_name)
      if the_lines.key?(path_name)
        the_lines[path_name].visits += 1
      else
        the_lines[path_name] = self::BUILDER.new(path_name, 1)
      end
    end
  end
end
