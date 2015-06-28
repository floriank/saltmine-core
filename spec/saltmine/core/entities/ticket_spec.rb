require 'spec_helper'

describe Saltmine::Core::Ticket do
  let(:ticket) { described_class.new }

  it 'should have a subject' do
    ticket.subject = 'TestTicket'
    expect(ticket.subject).to eql 'TestTicket'
  end

  it 'should have a description' do
    ticket.description = 'TestTicket'
    expect(ticket.description).to eql 'TestTicket'
  end

  it 'should have a project id' do
    ticket.project_id = 42
    expect(ticket.project_id).to eql 42
  end
end
