require 'bundler/setup'
Bundler.setup

require 'saltmine/core'
require 'pry'

RSpec.configure do |conf|
  conf.before(:each) do
    [
      Saltmine::Core::TicketRepository,
      Saltmine::Core::ProjectRepository
    ].each do |repo|
      repo.all.each { |item| repo.delete item }
    end

  end
end

Lotus::Model.configure do
  adapter type: :memory, uri: 'memory://spec/db/saltmine-core'

  mapping do

    collection :saltmine_projects do
      entity Saltmine::Core::Project
      repository Saltmine::Core::ProjectRepository

      attribute :id,   Integer
      attribute :title, String
      attribute :description, String
    end

    collection :saltmine_tickets do
      entity Saltmine::Core::Ticket
      repository Saltmine::Core::TicketRepository

      attribute :id,   Integer
      attribute :subject, String
      attribute :description, String
      attribute :project_id, Integer
    end
  end
end.load!
