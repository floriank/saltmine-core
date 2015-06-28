require 'spec_helper'

describe Saltmine::Core::Commands::UpdateProject do
  let(:old_options) { { title: 'Old title', description: 'Foobar' } }
  let(:create_project) { Saltmine::Core::Commands::CreateProject.new(old_options) }
  let(:cmd) { described_class.new }

  it 'should update an existing project' do
    project = create_project.call
    cmd.options = { id: project.id, title: 'New title' }
    result = cmd.call
    expect(result).to be_a Saltmine::Core::Project
    expect(result.title).to eql 'New title'
    expect(result.description).to eql 'Foobar'
  end

  it 'should crash when the entity is not found' do
    cmd.options = { id: 49, title: 'BarFoo' }
    expect { cmd.call }.to raise_error(Saltmine::Core::Error::EntityNotFound)
  end
end
