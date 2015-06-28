module Saltmine
  module Core
    class Project
      include Lotus::Entity

      attributes :title, :description
    end
  end
end
