# frozen_string_literal: true

require 'spec_helper'

describe 'LogParcer' do
  before(:all) do
    @file_path = 'spec/fixtures/files/webserver.log'
  end

  let(:log_parcer) { LogParcer.new(file_path: @file_path) }

  context 'initialization' do
    it 'keeping the file_path.' do
      expect(log_parcer.file_path).to eq @file_path
    end

    it 'fails without file_path.' do
      expect { LogParcer.new }.to raise_error(ArgumentError)
    end
  end
end

describe 'LogParcer call the Director' do
  let(:log_parcer) { LogParcer.new(file_path: @file_path) }

  it 'for webpages_rating' do
    expect_any_instance_of(WebpagesDirector).to receive(:validate_and_act).once
    log_parcer.webpages_rating
  end

  it 'for resources_rating' do
    expect_any_instance_of(ResourcesDirector).to receive(:validate_and_act).once
    log_parcer.resources_rating
  end

  it 'for resources_rating' do
    expect_any_instance_of(ResourcesDirector).to receive(:validate_and_act).once
    log_parcer.resources_rating
  end
end
