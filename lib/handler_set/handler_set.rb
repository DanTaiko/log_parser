# frozen_string_literal: true

##
# The HandlerSet sets and runs the handlers lineup
class HandlerSet
  HANDLERS = { webpages_rating: [FileValidator, Parser, Sorter, Presenter],
               unique_webpages_rating: [FileValidator, UniqParser, Sorter, Presenter] }.freeze

  def self.do_run(command, path)
    handlers = command.is_a?(Array) ? command : HANDLERS[command]
    handlers.inject(path) do |param, handler|
      handler.act(param)
    end
  end
end
