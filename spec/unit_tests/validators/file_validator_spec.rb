# frozen_string_literal: true

require 'spec_helper'

describe 'FilePresenceValidator' do
  it 'rise Error for bad file extention' do
    validator = FilePresenceValidator.new(file_path: 'spec/fixtures/files/bad.rb')
    expect(validator.valid?).to be_falsey
  end

  it 'rise Error for missing file' do
    validator = FilePresenceValidator.new(file_path: 'spec/fixtures/files/missing.rb')
    expect(validator.valid?).to be_falsey
  end
end
