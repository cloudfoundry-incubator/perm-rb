# frozen_string_literal: true

require 'spec_helper'

describe 'CloudFoundry::Perm::V1::Client' do
  let(:role_service_spy) { instance_double(CloudFoundry::Perm::Protos::RoleService::Stub) }
  let(:permission_service_spy) { instance_double(CloudFoundry::Perm::Protos::PermissionService::Stub) }

  let(:grpc_error) { GRPC::BadStatus.new('123', 'some grpc error') }

  subject(:client) { CloudFoundry::Perm::V1::Client.new(hostname: 'some-hostname', port: 'some-port', trusted_cas: ['some-trusted-ca']) }

  before do
    allow(CloudFoundry::Perm::Protos::RoleService::Stub).to receive(:new).and_return(role_service_spy)
    allow(CloudFoundry::Perm::Protos::PermissionService::Stub).to receive(:new).and_return(permission_service_spy)
  end

  describe '#create_role' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:create_role).and_raise(grpc_error)

      expect do
        client.create_role(role_name: 'some-role')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#get_role' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:get_role).and_raise(grpc_error)

      expect do
        client.get_role('some-role')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#delete_role' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:delete_role).and_raise(grpc_error)

      expect do
        client.delete_role('some-role')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#assign_role' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:assign_role).and_raise(grpc_error)

      expect do
        client.assign_role(role_name: 'some-role', actor_id: 'some-actor-id', namespace: 'some-namespace')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#unassign_role' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:unassign_role).and_raise(grpc_error)

      expect do
        client.unassign_role(role_name: 'some-role', actor_id: 'some-actor-id', namespace: 'some-namespace')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#has_role?' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:has_role).and_raise(grpc_error)

      expect do
        client.has_role?(role_name: 'some-role', actor_id: 'some-actor-id', namespace: 'some-namespace')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#list_actor_roles' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:list_actor_roles).and_raise(grpc_error)

      expect do
        client.list_actor_roles(actor_id: 'some-actor-id', namespace: 'some-namespace')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#list_role_permissions' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(role_service_spy).to receive(:list_role_permissions).and_raise(grpc_error)

      expect do
        client.list_role_permissions(role_name: 'some-role')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end

  describe '#has_permission?' do
    it 'returns a Transport error when given a GRPC::BadStatus' do
      allow(permission_service_spy).to receive(:has_permission).and_raise(grpc_error)

      expect do
        client.has_permission?(actor_id: 'some-actor-id', namespace: 'some-namespace', action: 'some-action', resource: 'some-resource')
      end.to raise_error(CloudFoundry::Perm::V1::Errors::BadStatus, grpc_error.message)
    end
  end
end
