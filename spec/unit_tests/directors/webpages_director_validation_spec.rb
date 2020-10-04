# frozen_string_literal: true

require 'spec_helper'

describe 'WebpagesDirector' do
  context 'validate_and_act' do
    let(:director) { WebpagesDirector.build(file_path: 'spec/fixtures/files/webserver.log') }

    it 'asking for the file validation' do
      expect_any_instance_of(FilePresenceValidator).to receive(:valid?).once.and_return(false)
      expect(director).not_to receive(:act)

      expect { director.validate_and_act }.to raise_error(ArgumentError)
    end

    it 'starting the show' do
      expect(director).to receive(:act).once
      director.validate_and_act
    end
  end
end
