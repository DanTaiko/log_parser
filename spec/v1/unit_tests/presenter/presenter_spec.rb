# frozen_string_literal: true

require 'spec_helper_v1'

describe 'Presenter' do
  before(:all) do
    @lines = YAML.load_file('spec/fixtures/lines_v1_presenter.yml')['lines'].each_with_object([]) do |line, collection|
      collection << Line.new(**line.transform_keys(&:to_sym))
    end
  end

  it 'print the result' do
    output = File.read('spec/fixtures/files/webpages_rating.out')
    presenter = Presenter.new(header: 'webpages_rating', line_postfix: 'visits')
    expect { presenter.prints(lines: @lines) }
      .to output(output)
      .to_stdout_from_any_process
  end
end
