# frozen_string_literal: true

require 'spec_helper'

describe 'WebpagesDirector' do
  before(:all) do
    @symbol_regex = /\A(?<symbol>\w+)/
    @collector = Struct.new(:builder) do
      def add(*) end
    end.new
    @file_path = 'spec/fixtures/files/webserver.log'
  end

  context 'initialization' do
    it 'keeping the file_path.' do
      director = WebpagesDirector.new(file_path: @file_path, collector: @collector)
      expect(director.file_path).to eq @file_path
    end

    it 'by build' do
      director = WebpagesDirector.build(file_path: @file_path)
      expect(director.file_path).to eq @file_path
    end

    it 'fails without file_path.' do
      expect { WebpagesDirector.build }.to raise_error(ArgumentError)
    end
  end
end
