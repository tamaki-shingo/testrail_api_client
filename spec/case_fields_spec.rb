RSpec.describe TestRailApiClient do
  require 'testrail_api_client'
  require 'dotenv/load'
  require 'date'
  url  = ENV['TESTRAIL_URL']
  user = ENV['TESTRAIL_USER']
  pass = ENV['TESTRAIL_PASS']

  client = TestRailApiClient::Client.new(url, user, pass)

  context 'Case Fields' do
    it 'can get test case fields' do
      fields = client.case_fields
      # Response is depends on your setting
      expect(fields).not_to be nil
    end
  end
end
