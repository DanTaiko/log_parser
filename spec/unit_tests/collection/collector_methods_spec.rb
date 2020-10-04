# frozen_string_literal: true

require 'spec_helper'

describe 'Collector#add' do
  before(:all) do
    @builder = Line
    @symbol = 'symbol'
    @title = 'title'
  end

  let(:collector) { Collector.new(builder: @builder) }

  it 'creates new member with the symbol' do
    expect { collector.add(@symbol) }.to change { collector.members.count }.from(0).to(1)
    member = collector.members.first
    expect(member.symbol).to eq @symbol
    expect(member.amount).to eq 1
  end

  it 'creates new member with the symbol and title' do
    expect { collector.add(@symbol, @title) }.to change { collector.members.count }.from(0).to(1)
    member = collector.members.first
    expect(member.symbol).to eq @symbol
    expect(member.title).to eq @title
    expect(member.amount).to eq 1
  end
end

describe 'Collector#unify' do
  before(:all) do
    @builder = Line
    @symbol = 'symbol'
    @title = 'title'
  end

  let(:collector) { Collector.new(builder: @builder) }

  it 'count uniq members' do
    3.times { collector.add(@symbol) }
    collector.unify
    expect(collector.members.count).to eq 1
  end
end
