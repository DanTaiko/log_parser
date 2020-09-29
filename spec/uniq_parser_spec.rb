# frozen_string_literal: true

require 'yaml'
require 'spec_helper'
require_relative '../lib/parser_config.rb'

describe 'Parser' do
  before(:all) do
    @file_path = 'spec/fixtures/files/webserver.log'
    file_data = File.read(@file_path).split("\n").map { |line| line.split[0] }
    @uniq_visits = file_data.each_with_object(Hash.new(0)) do |path_name, uniq_visits|
      uniq_visits[path_name] += 1
    end
  end

  context 'UniqParser valid run' do
    it 'gives correct lines amount' do
      lines = UniqParser.act(@file_path)
      expect(lines.size)
        .to eq @uniq_visits.size
    end
    it 'count correct visits' do
      lines = UniqParser.act(@file_path)
      lines.each do |line|
        expect(line.visits)
          .to eq @uniq_visits[line.path_name]
      end
    end
  end
end
