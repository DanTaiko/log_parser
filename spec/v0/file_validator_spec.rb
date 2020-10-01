# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_config.rb'

describe 'FileValidator' do
  it 'rise Error for bad file extention' do
    expect { FileValidator.act('spec/fixtures/files/bad.rb') }.to raise_error(RuntimeError)
  end

  it 'rise Error for missing file' do
    expect { FileValidator.act('spec/fixtures/files/missing.log') }.to raise_error(RuntimeError)
  end
end
