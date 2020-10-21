# frozen_string_literal: true

require 'spec_helper'

describe 'AverageGrouper initialization' do
  before(:all) do
    @lines = YAML.load_file('spec/fixtures/lines_v1_grouper.yml')['lines'].each_with_object([]) do |line, collection|
      collection << Line.new(**line.transform_keys(&:to_sym))
    end
  end

  it 'by_average' do
    grouped_lines = Grouper.build(method: :by_average).group(@lines)
    expect(grouped_lines.map(&:to_s).sort).to eq ['/about 1.0',
                                                  '/contact 1.0',
                                                  '/contact/2 1.0',
                                                  '/help_page 1.5',
                                                  '/home 1.0',
                                                  '/index 1.0']
  end
end
