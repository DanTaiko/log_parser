# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_config.rb'

describe 'Parser' do
  it 'rise Error for bad format' do
    expect { Parser.act('spec/fixtures/files/bad.log') }.to raise_error(RuntimeError)
  end

  it 'silent for empty log' do
    expect { Parser.act('spec/fixtures/files/empty.log') }.not_to raise_error
  end
end
