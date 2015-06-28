require 'bundler/setup'
Bundler.setup

require 'saltmine/core'

Lotus::Model.configure do
  adapter type: :memory, uri: 'memory://spec/db/saltmine-core'

  mapping do
    collection :project do
      entity Saltmine::Core::Project
      repository Saltmine::Core::ProjectRepository

      attribute :id,   Integer
      attribute :title, String
      attribute :description, String
    end
  end
end.load!
