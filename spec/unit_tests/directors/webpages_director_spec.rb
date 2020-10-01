# frozen_string_literal: true

require 'spec_helper'

describe 'WebpagesDirector' do
  before(:all) do
    @collector = Struct.new(:builder) do
      def add(*) end
    end.new
  end

  context 'validate_and_act' do
    let(:director) { WebpagesDirector.new(file_path: 'spec/fixtures/files/webserver.log', collector: @collector) }

    it 'asking for the file validation' do
      expect_any_instance_of(FilePresenceValidator).to receive(:valid?).once.and_return(false)
      expect(director).not_to receive(:act)

      expect { director.validate_and_act }.to raise_error(RuntimeError)
    end

    it 'starting the show' do
      expect(director).to receive(:act).once.and_return(true)
      director.validate_and_act
    end
  end
end
