# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/parser_config.rb'

describe 'Parser' do
  before(:all) do
    @file_path = 'spec/fixtures/files/webserver.log'
    file_data = File.read(@file_path).split("\n").map { |line| line.split[0] }
    @visits = file_data.each_with_object(Hash.new(0)) do |path_name, visits|
      path_name.sub!(%r{(\/\d+)}, '')
      visits[path_name] += 1
    end
  end

  context 'valid run' do
    it 'gives correct lines amount' do
      lines = Parser.act(@file_path)
      expect(lines.size)
        .to eq @visits.size
    end
    it 'count correct visits' do
      lines = Parser.act(@file_path)
      lines.each do |line|
        expect(line.visits)
          .to eq @visits[line.path_name]
      end
    end
  end
end
