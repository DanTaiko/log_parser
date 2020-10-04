# frozen_string_literal: true

require 'spec_helper'

describe 'AnalyzeDirector' do
  before(:all) do
    @collector = Struct.new(:builder) do
      def add(*) end
    end.new
  end

  context 'validate_and_act' do
    let(:director) { AnalyzeDirector.new(file_path: 'spec/fixtures/files/webserver.log', collector: @collector) }

    it 'starting the handlers' do
      members = []
      expect_any_instance_of(FileParser).to receive(:parse).once.and_return(members)
      presenter = AnalyzeDirectorPresenter.new(members: members)
      expect(AnalyzeDirectorPresenter).to receive(:new).once.and_return(presenter)
      expect(presenter).to receive(:by_visits).once
      expect(presenter).to receive(:by_uniq_views).once

      director.validate_and_act
    end
  end
end
