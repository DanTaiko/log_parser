# frozen_string_literal: true

require 'spec_helper'

describe 'ResourcesDirector' do
  before(:all) do
    @collector = Struct.new(:builder) do
      def add(*) end
    end.new
  end

  context 'validate_and_act' do
    let(:director) { ResourcesDirector.new(file_path: 'spec/fixtures/files/webserver.log', collector: @collector) }

    it 'starting the handlers' do
      expect_any_instance_of(FileParser).to receive(:parse).once
      expect(@collector).to receive(:members).once
      grouper = ResourceGrouper.new(builder: Line)
      expect(Grouper).to receive(:build).with(method: :by_resource).once.and_return(grouper)
      expect(grouper).to receive(:group).once
      expect_any_instance_of(Sorter).to receive(:sort).once
      expect_any_instance_of(Presenter).to receive(:prints).once

      director.validate_and_act
    end
  end
end
