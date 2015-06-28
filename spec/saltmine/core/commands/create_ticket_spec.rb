require 'spec_helper'

describe Saltmine::Core::Commands::CreateTicket do

  let(:cmd) { described_class.new options }
  let(:options) { { subject: 'Foo', description: 'bar' } }

  it 'should create a ticket with the given options' do
    ticket = cmd.call
    expect(ticket).to be_a Saltmine::Core::Ticket
    expect(ticket.subject).to eql 'Foo'
    expect(ticket.description).to eql 'bar'
    expect(ticket.id).not_to be_nil
  end

end
