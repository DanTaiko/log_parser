# frozen_string_literal: true

require 'spec_helper_v1'

describe 'Collector' do
  before(:all) do
    @builder = Struct.new(:symbol, :amount)
  end

  let(:collector) { Collector.new(builder: @builder) }

  context 'initialization' do
    it 'keeps the builder in state' do
      expect(collector.builder).to eq @builder
    end

    it 'fails without builder' do
      expect { Collector.new }.to raise_error(ArgumentError)
    end

    it 'fails unless builder.respond_to?(:new)' do
      expect { Collector.new(builder: '') }.to raise_error(ArgumentError)
    end

    it 'fails unless builder can create an object that having :symbol and :amount attributes' do
      expect { Collector.new(builder: String) }.to raise_error(ArgumentError)
    end
  end
end
