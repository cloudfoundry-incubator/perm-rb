# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: role.proto

require 'google/protobuf'

require 'actor_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "cloud_foundry.perm.protos.Role" do
    optional :id, :string, 1
    optional :name, :string, 2
  end
  add_message "cloud_foundry.perm.protos.CreateRoleRequest" do
    optional :name, :string, 1
  end
  add_message "cloud_foundry.perm.protos.CreateRoleResponse" do
    optional :role, :message, 1, "cloud_foundry.perm.protos.Role"
  end
  add_message "cloud_foundry.perm.protos.AssignRoleRequest" do
    optional :actor, :message, 1, "cloud_foundry.perm.protos.Actor"
    optional :role_id, :string, 2
  end
  add_message "cloud_foundry.perm.protos.AssignRoleResponse" do
  end
  add_message "cloud_foundry.perm.protos.HasRoleRequest" do
    optional :actor, :message, 1, "cloud_foundry.perm.protos.Actor"
    optional :role_id, :string, 2
  end
  add_message "cloud_foundry.perm.protos.HasRoleResponse" do
    optional :has_role, :bool, 1
  end
  add_message "cloud_foundry.perm.protos.ListActorRolesRequest" do
    optional :actor, :message, 1, "cloud_foundry.perm.protos.Actor"
  end
  add_message "cloud_foundry.perm.protos.ListActorRolesResponse" do
    repeated :roles, :message, 1, "cloud_foundry.perm.protos.Role"
  end
  add_message "cloud_foundry.perm.protos.GetRoleRequest" do
    optional :name, :string, 1
  end
  add_message "cloud_foundry.perm.protos.GetRoleResponse" do
    optional :role, :message, 1, "cloud_foundry.perm.protos.Role"
  end
end

module CloudFoundry
  module Perm
    module Protos
      Role = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.Role").msgclass
      CreateRoleRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.CreateRoleRequest").msgclass
      CreateRoleResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.CreateRoleResponse").msgclass
      AssignRoleRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.AssignRoleRequest").msgclass
      AssignRoleResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.AssignRoleResponse").msgclass
      HasRoleRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.HasRoleRequest").msgclass
      HasRoleResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.HasRoleResponse").msgclass
      ListActorRolesRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.ListActorRolesRequest").msgclass
      ListActorRolesResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.ListActorRolesResponse").msgclass
      GetRoleRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.GetRoleRequest").msgclass
      GetRoleResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.GetRoleResponse").msgclass
    end
  end
end
