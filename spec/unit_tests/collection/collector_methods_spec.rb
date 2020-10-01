# frozen_string_literal: true

require 'spec_helper'

describe 'Collector' do
  before(:all) do
    @builder = Line
    @symbol = 'symbol'
  end

  let(:collector) { Collector.new(builder: @builder) }

  context '#add' do
    it 'creates new member with the symbol' do
      expect { collector.add(@symbol) }.to change { collector.members.count }.from(0).to(1)
      member = collector.members.first
      expect(member.symbol).to eq @symbol
      expect(member.amount).to eq 1
    end
  end

  context '#unify' do
    it 'count uniq members' do
      3.times { collector.add(@symbol) }
      collector.unify
      expect(collector.members.count).to eq 1
    end
  end
end
