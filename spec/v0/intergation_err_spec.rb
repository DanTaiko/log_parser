# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_config.rb'

describe 'Integration' do
  context 'for errors' do
    it 'if no file_path' do
      output = File.read('spec/fixtures/files/no_file_path.out')
      expect { system %(bin/parser unique_webpages_rating) }
        .to output(output)
        .to_stderr_from_any_process
    end
    it 'if no file_path' do
      expect { system %(bin/parser unique_webpages_rating spec/fixtures/files/bad.log) }
        .to output(a_string_including('InvalidLogFormat'))
        .to_stderr_from_any_process
    end
  end
end
