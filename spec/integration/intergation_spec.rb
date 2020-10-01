# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_cli.rb'

describe 'Integration' do
  context 'for webpages_rating' do
    it 'for webpages_rating' do
      output = File.read('spec/fixtures/files/webpages_rating.out')
      expect { system %(bin/parser webpages_rating spec/fixtures/files/webserver.log) }
        .to output(output)
        .to_stdout_from_any_process
    end

    it 'for unique_webpages_rating' do
      output = File.read('spec/fixtures/files/unique_webpages_rating.out')
      expect { system %(bin/parser unique_webpages_rating spec/fixtures/files/webserver.log) }
        .to output(output)
        .to_stdout_from_any_process
    end
  end
end
