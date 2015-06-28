require 'spec_helper'

describe Saltmine::Core::Commands::UpdateTicket do
  let(:old_options) { { subject: 'Old title', description: 'Foobar' } }
  let(:create_ticket) { Saltmine::Core::Commands::CreateTicket.new(old_options) }
  let(:cmd) { described_class.new }

  it 'should update an existing project' do
    ticket = create_ticket.call
    cmd.options = { id: ticket.id, subject: 'New Subject', description: 'Foo' }
    result = cmd.call
    expect(result).to be_a Saltmine::Core::Ticket
    expect(result.subject).to eql 'New Subject'
    expect(result.description).to eql 'Foo'
  end

  it 'should crash when the entity is not found' do
    cmd.options = { id: 49, title: 'BarFoo' }
    expect { cmd.call }.to raise_error(Saltmine::Core::Error::EntityNotFound)
  end
end
