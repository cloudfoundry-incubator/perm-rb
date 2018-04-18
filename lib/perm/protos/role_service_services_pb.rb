# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: role_service.proto for package 'cloud_foundry.perm.protos'

require 'grpc'
require 'role_service_pb'

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
          rpc :DeleteRole, DeleteRoleRequest, DeleteRoleResponse
          rpc :AssignRole, AssignRoleRequest, AssignRoleResponse
          rpc :UnassignRole, UnassignRoleRequest, UnassignRoleResponse
          rpc :HasRole, HasRoleRequest, HasRoleResponse
          rpc :ListActorRoles, ListActorRolesRequest, ListActorRolesResponse
          rpc :ListRolePermissions, ListRolePermissionsRequest, ListRolePermissionsResponse
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
