# frozen_string_literal: true

require 'spec_helper'

describe 'FilePresenceValidator' do
  it 'pass' do
    validator = FilePresenceValidator.new(file_path: 'spec/fixtures/files/webserver.log')
    expect(validator.valid?).to be_truthy
    expect(validator.err_message).to be_nil
  end

  it 'rise Error for bad file extention' do
    validator = FilePresenceValidator.new(file_path: 'spec/fixtures/files/bad.rb')
    expect(validator.valid?).to be_falsey
    expect(validator.err_message).to eq 'The log file has a file extension other than ".log".'
  end

  it 'rise Error for missing file' do
    validator = FilePresenceValidator.new(file_path: 'spec/fixtures/files/missing.log')
    expect(validator.valid?).to be_falsey
    expect(validator.err_message).to eq 'The log file is missing.'
  end
end
