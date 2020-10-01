# frozen_string_literal: true

require 'spec_helper_v1'

describe 'log_parser' do
  it 'objects structure' do
    expect(FileValidator.new).to be
    expect(Presenter.new).to be
  end
end
