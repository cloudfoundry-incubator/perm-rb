# frozen_string_literal: true

require 'perm/protos'

module CloudFoundry
  module Perm
    module V1
      class Client
        attr_reader :hostname, :port

        def initialize(hostname:, port: 6283, trusted_cas:)
          raise ArgumentError, 'trusted_cas cannot be empty' if trusted_cas.empty?

          @hostname = hostname
          @port = port
          @url = "#{hostname}:#{port}"
          @trusted_cas = trusted_cas
        end

        def create_role(name)
          request = Protos::CreateRoleRequest.new(name: name)

          response = grpc_client.create_role(request)
          role = response.role

          Models::Role.new(id: role.id, name: role.name)
        end

        def get_role(name)
          request = Protos::GetRoleRequest.new(name: name)

          response = grpc_client.get_role(request)
          role = response.role

          Models::Role.new(id: role.id, name: role.name)
        end

        def delete_role(name)
          request = Protos::DeleteRoleRequest.new(name: name)

          grpc_client.delete_role(request)

          nil
        end

        def assign_role(role_name:, actor_id:, issuer:)
          actor = Protos::Actor.new(id: actor_id, issuer: issuer)
          request = Protos::AssignRoleRequest.new(actor: actor, role_name: role_name)

          grpc_client.assign_role(request)

          nil
        end

        def unassign_role(role_name:, actor_id:, issuer:)
          actor = Protos::Actor.new(id: actor_id, issuer: issuer)
          request = Protos::UnassignRoleRequest.new(actor: actor, role_name: role_name)

          grpc_client.unassign_role(request)

          nil
        end

        # rubocop:disable Naming/PredicateName
        def has_role?(role_name:, actor_id:, issuer:)
          actor = Protos::Actor.new(id: actor_id, issuer: issuer)
          request = Protos::HasRoleRequest.new(actor: actor, role_name: role_name)

          response = grpc_client.has_role(request)
          response.has_role
        end

        def list_actor_roles(actor_id:, issuer:)
          actor = Protos::Actor.new(id: actor_id, issuer: issuer)
          request = Protos::ListActorRolesRequest.new(actor: actor)

          response = grpc_client.list_actor_roles(request)
          roles = response.roles

          roles.map do |role|
            Models::Role.new(id: role.id, name: role.name)
          end
        end

        private

        attr_reader :url, :trusted_cas, :tls_credentials

        def load_tls_credentials
          @tls_credentials ||= GRPC::Core::ChannelCredentials.new(trusted_cas.join("\n"))
        end

        def grpc_client
          load_tls_credentials
          Protos::RoleService::Stub.new(url, tls_credentials)
        end
      end
    end
  end
end
