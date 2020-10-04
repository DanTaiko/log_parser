# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_cli.rb'

describe 'Integration' do
  context 'for analyze' do
    it 'for analyze' do
      output = File.read('spec/fixtures/files/analyze.out')
      expect { system %(bin/parser analyze spec/fixtures/files/webserver.log) }
        .to output(output)
        .to_stdout_from_any_process
    end

    it 'for webpages_rating' do
      output = File.read('spec/fixtures/files/webpages_rating.out')
      expect { system %(bin/parser webpages_rating spec/fixtures/files/webserver.log) }
        .to output(output)
        .to_stdout_from_any_process
    end

    it 'for resources_rating' do
      output = File.read('spec/fixtures/files/resources_rating.out')
      expect { system %(bin/parser resources_rating spec/fixtures/files/webserver.log) }
        .to output(output)
        .to_stdout_from_any_process
    end
  end
end
