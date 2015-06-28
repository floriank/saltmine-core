require 'spec_helper'

describe Saltmine::Core::Commands::CreateProject do
  let(:cmd) { described_class.new options }

  context 'w/ options' do
    let(:options) do
      {
        title: 'TestProject',
        description: 'a test to see'
      }
    end

    it 'should create a project as a result' do
      expect(cmd.call).to be_a Saltmine::Core::Project
      expect(cmd.call.title).to eql 'TestProject'
      expect(cmd.call.description).to eql 'a test to see'
      expect(cmd.call.id).to be_truthy
    end
  end
end
