# frozen_string_literal: true

require 'spec_helper'

describe 'Collector initialization' do
  it 'passes with valid builder and keeps the builder in state' do
    builder = Struct.new(:symbol, :amount, :title, keyword_init: true)
    collector = Collector.new(builder: builder)
    expect(collector.builder).to eq builder
  end

  it 'fails without builder' do
    expect { Collector.new }.to raise_error(ArgumentError)
  end

  it 'fails unless builder.respond_to?(:new)' do
    expect { Collector.new(builder: '') }.to raise_error(ArgumentError)
  end

  it 'fails unless builder can create an object that having required attributes' do
    expect { Collector.new(builder: String) }.to raise_error(ArgumentError)
  end
end
