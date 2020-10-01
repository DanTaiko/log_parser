# frozen_string_literal: true

require 'spec_helper_v1'

describe 'Sorter' do
  before(:all) do
    @arttibute = :amount
  end

  let(:sorter) { Sorter.new(arttibute: @arttibute) }

  context 'initialization' do
    it 'keeps the arttibute in state' do
      expect(sorter.arttibute).to eq @arttibute
    end

    it 'fails without arttibute' do
      expect { Sorter.new }.to raise_error(ArgumentError)
    end
  end
end
