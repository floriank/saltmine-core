require 'spec_helper'

describe Saltmine::Core::Project do
  let(:project) { described_class.new }

  it 'should have a title' do
    project.title = 'DemoProject'
    expect(project.title).to eql 'DemoProject'
  end

  it 'should have a description' do
    project.description = 'A demo description'
    expect(project.description).to eql 'A demo description'
  end
end
