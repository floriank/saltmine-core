require 'spec_helper'

describe Saltmine::Core::Project do
  let(:project) { described_class.new }

  it 'should have a title' do
    project.title = 'DemoProject'
    expect(project.title).to eql 'DemoProject'
  end
end
