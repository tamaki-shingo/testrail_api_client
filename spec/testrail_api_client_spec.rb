# frozen_string_literal: true

RSpec.describe TestRailApiClient do
  require 'testrail_api_client'
  require 'dotenv/load'
  require 'date'
  url  = ENV['TESTRAIL_URL']
  user = ENV['TESTRAIL_USER']
  pass = ENV['TESTRAIL_PASS']

  client = TestRailApiClient::Client.new(url, user, pass)
  it 'has a version number' do
    expect(TestRailApiClient::VERSION).not_to be nil
  end

  context 'Project' do
    pj = nil
    it 'can be create new pj' do
      opt = {
        'name': 'Sandbox for TestRail API Client Test',
        'announcement': 'This PJ is created by test script.',
        'suite_mode': 1
      }
      pj = client.add_project(opt)
      expect(pj).not_to be nil
      expect(pj['id']).not_to be nil
    end

    it 'can be get specified PJ' do
      result = client.project(pj['id'])
      expect(result).not_to be nil
      expect(result['name']).to eq('Sandbox for TestRail API Client Test')
    end

    it 'can be get PJ ids' do
      result = client.projects_ids
      expect(result.count).to be > 0
      expect(result).to include(pj['id'])
    end

    it 'can be get PJs' do
      result = client.projects
      expect(result).not_to be nil
      expect(result.count).to be > 0
    end

    it 'can be update PJ' do
      opt = {
        'name': '[UPDATED] Sandbox for TestRail API Client Test',
        'announcement': 'This PJ is created by test script.',
        'suite_mode': 1
      }
      result = client.update_project(pj['id'], opt)
      expect(result['name']).to eq('[UPDATED] Sandbox for TestRail API Client Test')
    end

    it 'can be delete PJ' do
      client.delete_project(pj['id'])
      pjs = client.projects.map { |project| project['id'] }
      expect(pjs).not_to include pj['id']
    end
  end
end
