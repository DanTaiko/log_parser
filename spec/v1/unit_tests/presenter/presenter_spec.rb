# frozen_string_literal: true

require 'spec_helper_v1'

describe 'Presenter' do
  before(:all) do
    @lines = YAML.load_file('spec/fixtures/lines_v1_presenter.yml')['lines'].each_with_object([]) do |line, collection|
      collection << Line.new(**line.transform_keys(&:to_sym))
    end
    @header = 'webpages_rating'
    @postfix = 'visits'
  end

  let(:presenter) { Presenter.new(header: @header, line_postfix: @postfix) }

  it 'initialization works' do
    expect(presenter.header).to eq @header
    expect(presenter.line_postfix).to eq @postfix
  end

  it 'print the result' do
    output = File.read('spec/fixtures/files/webpages_rating.out')
    expect { presenter.prints(lines: @lines) }
      .to output(output)
      .to_stdout_from_any_process
  end
end
