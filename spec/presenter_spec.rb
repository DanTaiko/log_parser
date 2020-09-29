# frozen_string_literal: true

require 'yaml'
require 'spec_helper'
require_relative '../lib/parser_config.rb'

describe 'Presenter' do
  before(:all) do
    @lines = YAML.load_file('spec/fixtures/lines.yml')['lines']
  end

  it 'print the result' do
    print_lines = @lines.map { |line| PrintLine.new(*line.split) }
    output = "=== webpages_rating ===\n" + (@lines + ['']).join(" visits\n")
    expect { Presenter.act(print_lines) }
      .to output(output)
      .to_stdout_from_any_process
  end

  context 'PrintLine' do
    it 'makes valid print' do
      line = PrintLine.new(*@lines[0].split)
      expect(line.print).to eq @lines[0] + ' visits'
    end

    it 'rise error with the wrong params' do
      expect { PrintLine.new }.to raise_error(ArgumentError)
    end
  end

  context 'UniqPrintLine' do
    it 'makes valid print' do
      line = UniqPrintLine.new(*@lines[0].split)
      expect(line.print).to eq @lines[0] + ' unique views'
    end
  end
end
