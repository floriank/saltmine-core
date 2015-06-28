require 'spec_helper'

describe Saltmine::Core::Commands::ListTickets do
  let(:project) { create_project.new(title: 'foo').call }
  let(:empty_project) { create_project.new(title: 'foo').call }
  let(:cmd) { described_class.new project: project }
  let(:empty_cmd) { described_class.new project: empty_project }

  let(:create_ticket) { Saltmine::Core::Commands::CreateTicket }
  let(:create_project) { Saltmine::Core::Commands::CreateProject }

  describe '#with_project' do
    it 'should provide a set of tickets for a project with tickets' do
      3.times do |n|
        create_ticket.new(subject: "foo#{n}", project_id: project.id).call
      end

      result = cmd.for_project
      expect(result.count).to eql 3
    end

    it 'should provide an empty set for a project w/o tickets' do
      result = empty_cmd.for_project
      expect(result).to be_empty
    end
  end

  describe '#without_project' do
    it 'should provide an empty set for a project with tickets' do
      expect(cmd.for_project).to be_empty
    end

    it 'should provide a list of tickets w/o a project' do
      10.times do |n|
        create_ticket.new(subject: "bar#{n}", project_id: nil).call
      end

      result = cmd.without_project
      expect(result.count).to eql 10
    end
  end
end
