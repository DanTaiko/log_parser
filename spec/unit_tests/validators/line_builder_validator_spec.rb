# frozen_string_literal: true

require 'spec_helper'

describe 'LineBuilderValidator' do
  it 'initialization fails without builder' do
    expect { LineBuilderValidator.new }.to raise_error(ArgumentError)
  end

  it 'passes with valid builder and keeps the builder in state' do
    builder = Struct.new(:symbol, :amount, :title, keyword_init: true)
    validator = LineBuilderValidator.new(builder: builder)
    expect(validator.builder).to eq builder
    expect { validator.check_with_error }.not_to raise_error
  end

  it 'fails unless builder.respond_to?(:new)' do
    expect { LineBuilderValidator.new(builder: '').check_with_error }.to raise_error(ArgumentError)
  end

  it 'fails unless builder can create an object that having required attributes' do
    expect { LineBuilderValidator.new(builder: String).check_with_error }.to raise_error(ArgumentError)
  end
end
