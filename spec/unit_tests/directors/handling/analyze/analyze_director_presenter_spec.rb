# frozen_string_literal: true

require 'spec_helper'

describe 'AnalyzeDirectorPresenter initialization' do
  let(:the_members) { 'members' }

  it 'keeping the members.' do
    presenter = AnalyzeDirectorPresenter.new(members: the_members)
    expect(presenter.members).to eq the_members
  end

  it 'fails without the members.' do
    expect { AnalyzeDirectorPresenter.new }.to raise_error(ArgumentError)
  end
end

describe 'AnalyzeDirectorPresenter' do
  let(:the_members) { 'members' }
  let(:ad_presenter) { AnalyzeDirectorPresenter.new(members: the_members) }
  let(:grouper) { VisitsGrouper.new(builder: Line) }

  it ':by_visits works' do
    expect(Grouper).to receive(:build).with(method: :by_visits).once.and_return(grouper)
    expect(grouper).to receive(:group).with(the_members).once.and_return(@lines)
    expect_any_instance_of(Sorter).to receive(:sort).with(@lines).once
    expect_any_instance_of(Presenter).to receive(:prints).with(lines: @lines).once

    ad_presenter.by_visits
  end

  it ':by_uniq_views works' do
    expect(Grouper).to receive(:build).with(method: :by_uniq_views).once.and_return(grouper)
    expect(grouper).to receive(:group).with(the_members).once.and_return(@lines)
    expect_any_instance_of(Sorter).to receive(:sort).with(@lines).once
    expect_any_instance_of(Presenter).to receive(:prints).with(lines: @lines).once

    ad_presenter.by_uniq_views
  end
end
