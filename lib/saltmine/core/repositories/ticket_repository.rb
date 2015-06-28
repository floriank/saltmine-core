module Saltmine
  module Core
    class TicketRepository
      include Lotus::Repository

      def self.with_project(project)
        query do
          where(project_id: project.id)
        end
      end

      def self.without_project
        query do
          where project_id: nil
        end
      end
    end
  end
end
