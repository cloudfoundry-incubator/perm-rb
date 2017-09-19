# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: role.proto for package 'cloud_foundry.perm.protos'

require 'grpc'
require 'role_pb'

module CloudFoundry
  module Perm
    module Protos
      module RoleService
        class Service

          include GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'cloud_foundry.perm.protos.RoleService'

          rpc :CreateRole, CreateRoleRequest, CreateRoleResponse
          rpc :GetRole, GetRoleRequest, GetRoleResponse
          rpc :AssignRole, AssignRoleRequest, AssignRoleResponse
          rpc :HasRole, HasRoleRequest, HasRoleResponse
          rpc :ListActorRoles, ListActorRolesRequest, ListActorRolesResponse
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
