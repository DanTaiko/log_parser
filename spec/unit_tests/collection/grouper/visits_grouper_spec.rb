# frozen_string_literal: true

require 'spec_helper'

describe 'Grouper initialization' do
  before(:all) do
    @lines = YAML.load_file('spec/fixtures/lines_v1_grouper.yml')['lines'].each_with_object([]) do |line, collection|
      collection << Line.new(**line.transform_keys(&:to_sym))
    end
  end

  it 'by_visits' do
    grouped_lines = Grouper.build(method: :by_visits).group(@lines)
    expect(grouped_lines.map(&:to_s).sort).to eq ['/about 1',
                                                  '/contact 1',
                                                  '/contact/2 1',
                                                  '/help_page 3',
                                                  '/home 1',
                                                  '/index 1']
  end
end
