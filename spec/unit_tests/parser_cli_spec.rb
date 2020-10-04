# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_cli.rb'

describe 'ParserCLI' do
  before(:all) do
    @file_path = 'spec/fixtures/files/webserver.log'
  end

  let(:parcer_cli) { ParserCLI.new }

  context 'call the LogParcer' do
    it 'for analyze' do
      expect_any_instance_of(LogParcer).to receive(:analyze).once
      parcer_cli.analyze(@file_path)
    end

    it 'for webpages_rating' do
      expect_any_instance_of(LogParcer).to receive(:webpages_rating).once
      parcer_cli.webpages_rating(@file_path)
    end

    it 'for resources_rating' do
      expect_any_instance_of(LogParcer).to receive(:resources_rating).once
      parcer_cli.resources_rating(@file_path)
    end
  end
end
