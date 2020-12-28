# frozen_string_literal: true

RSpec.describe TestRailApiClient do
  require 'testrail_api_client'
  require 'dotenv/load'
  require 'date'
  url  = ENV['TESTRAIL_URL']
  user = ENV['TESTRAIL_USER']
  pass = ENV['TESTRAIL_PASS']
  project_id = ENV['TESTRAIL_PJ']

  client = TestRailApiClient::Client.new(url, user, pass)

  context 'Configurations' do
    context 'get' do
      it 'can be get configs' do
        result = client.configs(project_id)
        expect(result).not_to be nil
        expect(result.count).to be > 0
      end
    end

    context 'config group' do
      it 'can be edit config group' do
        config_group = client.add_config_group(project_id, 'sample config group')
        expect(config_group).not_to be nil
        expect(config_group['name']).to eq 'sample config group'
        updated_config_group = client.update_config_group(config_group['id'], '[updated] sample config group')
        expect(updated_config_group).not_to be nil
        expect(updated_config_group['name']).to eq '[updated] sample config group'
        client.delete_config_group(updated_config_group['id'])
        result = client.configs(project_id).find { |group| group['id'] == updated_config_group['id'] }
        expect(result).to be nil
      end
    end

    context 'config' do
      it 'can be edit config' do
        config_group_id = client.add_config_group(project_id, 'sample config group')['id']
        new_config = client.add_config(config_group_id, 'sample config')
        expect(new_config).not_to be nil
        expect(new_config['name']).to eq 'sample config'
        updated_config = client.update_config(new_config['id'], '[updated] sample config')
        expect(updated_config).not_to be nil
        expect(updated_config['name']).to eq '[updated] sample config'
        client.delete_config(updated_config['id'])
        result = client.configs(project_id).map { |g| g['configs'] }.flatten!.find { |config| config['id'] == updated_config['id'] }
        expect(result).to be nil
        client.delete_config_group(config_group_id)
      end
    end
  end
end
