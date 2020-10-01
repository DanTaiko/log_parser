# frozen_string_literal: true

require 'yaml'
require 'spec_helper'
require_relative '../../lib/parser_config.rb'

describe 'HandlerSet' do
  before(:all) do
    @raw_lines = YAML.load_file('spec/fixtures/lines.yml')['lines']
    @lines = @raw_lines.map { |line| PrintLine.new(*line.split) }
    @sorted_lines = Sorter.act(@lines)
  end

  context '#do_run fire the show' do
    it 'for Presenter' do
      expect(Presenter).to receive(:act).with(@lines)
      HandlerSet.do_run([Presenter], @lines)
    end

    it 'for Sorter and Presenter' do
      expect(Sorter).to receive(:act).with(@lines).and_return(@sorted_lines)
      expect(Presenter).to receive(:act).with(@sorted_lines)
      HandlerSet.do_run([Sorter, Presenter], @lines)
    end
  end

  it 'integrated test' do
    output = "=== webpages_rating ===\n" + (@sorted_lines.map(&:print) + ['']).join("\n")
    expect { HandlerSet.do_run([Sorter, Presenter], @lines) }
      .to output(output)
      .to_stdout_from_any_process
  end
end
