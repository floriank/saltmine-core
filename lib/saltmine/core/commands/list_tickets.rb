module Saltmine
  module Core
    module Commands
      class ListTickets
        def initialize(options = {})
          @project = options.fetch :project, project_model.new
        end

        def for_project
          repo.with_project(@project)
        end

        def without_project
          repo.without_project
        end

        private

        def project_model
          Saltmine::Core::Project
        end

        def repo
          Saltmine::Core::TicketRepository
        end
      end
    end
  end
end
