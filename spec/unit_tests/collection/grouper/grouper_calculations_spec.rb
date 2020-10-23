# frozen_string_literal: true

require 'spec_helper'

describe 'GrouperCalculations' do
  let(:lines) do
    YAML.load_file('spec/fixtures/lines_v1_grouper.yml')['lines'].each_with_object([]) do |line, collection|
      collection << Line.new(**line.transform_keys(&:to_sym))
    end
  end

  it 'find_avagare_views' do
    expect(GrouperCalculations.find_avagare_views(lines)).to eq 4.0
  end
end
