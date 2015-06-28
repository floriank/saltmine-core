module Saltmine
  module Core
    class TicketRepository
      include Lotus::Repository

      def self.in_project(project)
        where(project_id: project.id)
      end
    end
  end
end
