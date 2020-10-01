# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib_v1/log_parser.rb'

describe 'log_parser' do
  it 'objects structure' do
    expect(Line.new(symbol: 'symbol')).to be
    expect(Collector.new(builder: 'builder')).to be
    expect(Sorter.new(arttibute: :arttibute)).to be
    expect(FileValidator.new).to be
    expect(FileParser.new(file_path: 'file_path', collector: 'collector', symbol_regex: /\w/)).to be
    expect(Presenter.new(lines: [])).to be
  end
end
