# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_cli.rb'

describe 'Integration' do
  it 'for analyze' do
    output = File.read('spec/fixtures/files/analyze.out')
    expect { system %(bin/parser analyze spec/fixtures/files/webserver.log) }
      .to output(output)
      .to_stdout_from_any_process
  end
end

describe 'Integration' do
  it 'for average_rating' do
    output = File.read('spec/fixtures/files/average_rating.out')
    expect { system %(bin/parser average_rating spec/fixtures/files/webserver.log) }
      .to output(output)
      .to_stdout_from_any_process
  end
end

describe 'Integration' do
  it 'for resources_rating' do
    output = File.read('spec/fixtures/files/resources_rating.out')
    expect { system %(bin/parser resources_rating spec/fixtures/files/webserver.log) }
      .to output(output)
      .to_stdout_from_any_process
  end
end

describe 'Integration' do
  it 'for webpages_rating' do
    output = File.read('spec/fixtures/files/webpages_rating.out')
    expect { system %(bin/parser webpages_rating spec/fixtures/files/webserver.log) }
      .to output(output)
      .to_stdout_from_any_process
  end
end
