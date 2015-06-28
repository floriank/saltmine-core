module Saltmine
  module Core
    module Commands
      class Crud
        class << self
          attr_accessor :method
        end

        attr_accessor :options

        def call
          send self.class.method
        end

        def initialize(options = {})
          @options = options
        end

        def create
          repo.create object.new(@options)
        end

        def update
          attributes = @options.dup
          entity = repo.find attributes.delete(:id)
          raise Saltmine::Core::Error::EntityNotFound if entity.nil?
          attributes.each do |attr, value|
            entity.send "#{attr}=", value if entity.respond_to? "#{attr}="
          end
          repo.update entity
        end

        def self.define_methods(obj_sym)
          obj_name, repo_name = names_from obj_sym
          define_method :object do
            Saltmine::Core.const_get(obj_name)
          end

          define_method :repo do
            Saltmine::Core.const_get(repo_name)
          end
        end

        def self.names_from(string)
          name = string.capitalize
          repo_name = "#{name}Repository"
          [name, repo_name]
        end

        def self.creates(obj_sym)
          self.method = :create
          define_methods(obj_sym)
        end

        def self.updates(obj_sym)
          self.method = :update
          define_methods(obj_sym)
        end
      end
    end
  end
end
