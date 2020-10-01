# frozen_string_literal: true

require 'spec_helper_v1'

describe 'Sorter' do
  before(:all) do
    @arttibute = :amount
    @lines = YAML.load_file('spec/fixtures/lines_v1_sorter.yml')['lines'].each_with_object([]) do |line, collection|
      collection << Line.new(**line.transform_keys(&:to_sym))
    end
  end

  let(:sorter) { Sorter.new(arttibute: @arttibute) }

  context 'sort' do
    it 'sort the lines' do
      expect(@lines.map(&:amount))
        .to eql [5, 2, 4, 3, 1]
      sorter.sort(@lines)
      expect(@lines.map(&:amount))
        .to eql [5, 4, 3, 2, 1]
    end
  end
end
