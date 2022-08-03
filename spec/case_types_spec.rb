# frozen_string_literal: true

RSpec.describe TestRailApiClient do
  require 'testrail_api_client'
  require 'dotenv/load'
  require 'date'
  url  = ENV['TESTRAIL_URL']
  user = ENV['TESTRAIL_USER']
  pass = ENV['TESTRAIL_PASS']

  client = TestRailApiClient::Client.new(url, user, pass)

  context 'Case Types' do
    it 'can get test case types' do
      types = client.case_types
      # Response is depends on your setting
      expect(types).not_to be nil
    end
  end
end
