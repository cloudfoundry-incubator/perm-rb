# frozen_string_literal: true

module CloudFoundry
  module Perm
    module V1
      module Models
        class Role < BaseModel
          attr_reader :id, :name

          def initialize(id:, name:)
            @id = id
            @name = name
          end
        end
      end
    end
  end
end