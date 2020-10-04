# frozen_string_literal: true

require 'spec_helper'

describe 'LineParser#find_symbol' do
  before(:all) do
    @file_line = 'symbol title'
    @symbol_regex = /\A(?<symbol>\w+)/
  end

  let(:parser) { LineParser.new(symbol_regex: @symbol_regex) }

  it 'fails without file_line' do
    expect { parser.find_symbol }.to raise_error(ArgumentError)
  end

  it 'fails with a bad file_line' do
    expect { parser.find_symbol(file_line: 123) }.to raise_error(ArgumentError)
  end

  it 'fails for the line without symbol' do
    expect { parser.find_symbol(file_line: '') }.to raise_error(ArgumentError)
  end

  it 'return the founded sysbol' do
    expect(parser.find_symbol(file_line: @file_line)).to eq 'symbol'
  end
end

describe 'LineParser#find_title' do
  before(:all) do
    @file_line = 'symbol title'
    @symbol_regex = /\A(?<symbol>\w+)/
    @title_regex = /(?<title>\w+)\z/
  end

  let(:parser) { LineParser.new(symbol_regex: @symbol_regex, title_regex: @title_regex) }

  it 'fails without file_line' do
    expect { parser.find_title }.to raise_error(ArgumentError)
  end

  it 'fails with a bad file_line' do
    expect { parser.find_title(file_line: 123) }.to raise_error(ArgumentError)
  end

  it 'fails for the line without title' do
    expect { parser.find_title(file_line: '') }.to raise_error(ArgumentError)
  end

  it 'return the founded title' do
    expect(parser.find_symbol(file_line: @file_line)).to eq 'title'
  end
end

describe 'LineParser#find_symbol_and_title' do
  before(:all) do
    @file_line = 'symbol title'
    @symbol_regex = /\A(?<symbol>\w+)/
    @title_regex = /(?<title>\w+)\z/
  end

  let(:parser) { LineParser.new(symbol_regex: @symbol_regex, title_regex: @title_regex) }

  it 'calls #find_symbol and #find_title' do
    expect(parser).to receive(:find_symbol).with(@file_line).once.and_return('symbol')
    expect(parser).to receive(:find_title).with(@file_line).once.and_return('title')
    expect(director.find_symbol_and_title).to eq %w[symbol title]
  end
end
