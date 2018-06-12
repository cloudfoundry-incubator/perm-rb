# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: permission_service.proto

require 'google/protobuf'

require 'actor_pb'
require 'group_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "cloud_foundry.perm.protos.HasPermissionRequest" do
    optional :actor, :message, 1, "cloud_foundry.perm.protos.Actor"
    optional :action, :string, 2
    optional :resource, :string, 3
    repeated :groups, :message, 4, "cloud_foundry.perm.protos.Group"
  end
  add_message "cloud_foundry.perm.protos.HasPermissionResponse" do
    optional :has_permission, :bool, 1
  end
  add_message "cloud_foundry.perm.protos.ListResourcePatternsRequest" do
    optional :actor, :message, 2, "cloud_foundry.perm.protos.Actor"
    optional :action, :string, 3
    repeated :groups, :message, 4, "cloud_foundry.perm.protos.Group"
  end
  add_message "cloud_foundry.perm.protos.ListResourcePatternsResponse" do
    repeated :resource_patterns, :string, 2
  end
end

module CloudFoundry
  module Perm
    module Protos
      HasPermissionRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.HasPermissionRequest").msgclass
      HasPermissionResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.HasPermissionResponse").msgclass
      ListResourcePatternsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.ListResourcePatternsRequest").msgclass
      ListResourcePatternsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("cloud_foundry.perm.protos.ListResourcePatternsResponse").msgclass
    end
  end
end
