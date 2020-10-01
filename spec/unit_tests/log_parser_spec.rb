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

  context 'call the Director' do
    it 'for webpages_rating' do
      expect_any_instance_of(WebpagesDirector).to receive(:validate_and_act).once
      log_parcer.webpages_rating
    end

    it 'for unique_webpages_rating' do
      expect_any_instance_of(UniqueWebpagesDirector).to receive(:validate_and_act).once
      log_parcer.unique_webpages_rating
    end
  end
end
