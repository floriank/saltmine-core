require 'lotus-model'
require 'saltmine/core/version'
require 'saltmine/core/entities'
require 'saltmine/core/commands'
require 'saltmine/core/repositories'

module Saltmine
  module Core
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield configuration
    end

    class Configuration
      # config options go here
    end
  end
end
