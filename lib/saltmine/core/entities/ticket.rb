module Saltmine
  module Core
    class Ticket
      include Lotus::Entity

      attributes :subject, :description, :project_id
    end
  end
end
