module Saltmine
  module Core
    module Commands
      class Abstract
        def self.deals_with(obj_sym)
          obj_name, repo_name = names_from obj_sym
          define_method :object do
            Saltmine::Core.const_get(obj_name)
          end

          define_method :repo do
            Saltmine::Core.const_get(repo_name)
          end
        end

        def initialize(options = {})
          @options = options
        end

        def call
          repo.create(object.new(@options))
        end

        def self.names_from(string)
          name = string.capitalize
          repo_name = "#{name}Repository"
          [name, repo_name]
        end
      end
    end
  end
end
