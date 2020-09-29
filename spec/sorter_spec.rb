# frozen_string_literal: true

require 'yaml'
require 'spec_helper'
require_relative '../lib/parser_config.rb'

describe 'Sorter' do
  before(:all) do
    @lines = YAML.load_file('spec/fixtures/lines.yml')['lines']
    @lines = @lines.map do |line|
      line = line.split
      line[-1] = line[-1].to_i
      PrintLine.new(*line)
    end
  end

  it 'sort the lines' do
    expect(@lines.map(&:visits))
      .to contain_exactly(40, 20, 10, 30)
    expect(Sorter.act(@lines).map(&:visits).map(&:to_i))
      .to contain_exactly(40, 30, 20, 10)
  end
end
