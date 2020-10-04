# frozen_string_literal: true

require 'spec_helper'

describe 'Grouper initialization' do
  before(:all) do
    @lines = YAML.load_file('spec/fixtures/lines_v1_grouper.yml')['lines'].each_with_object([]) do |line, collection|
      collection << Line.new(**line.transform_keys(&:to_sym))
    end
  end

  it 'is a absruct class' do
    expect { Grouper.new }.to raise_error(NotImplementedError)
  end

  it 'fails the new method' do
    expect { Grouper.build(method: 'method') }.to raise_error(NotImplementedError)
  end
end
