RSpec.describe TestRailApiClient do
  require 'testrail_api_client'
  require 'dotenv/load'
  require 'date'
  url  = ENV['TESTRAIL_URL']
  user = ENV['TESTRAIL_USER']
  pass = ENV['TESTRAIL_PASS']

  client = TestRailApiClient::Client.new(url, user, pass)

  context 'Case Fields' do
    it 'can get case custom fields' do
      fields = client.case_fields
      # Response is depends on your setting
      expect(fields).not_to be nil
    end
    it 'can add case custom field' do
      # It have been able to be manually verified the behavior of this API, 
      # but since the deletion API is not supported, It have be excluded it from the unit test.

      # opt = {
      #   "type": 'Multiselect',
      #   "name": 'tmk_multiselect',
      #   "label": 'TMK Multiselect',
      #   "description": 'my custom Multiselect description',
      #   "configs": [
      #     {
      #       "context": {
      #         "is_global": false,
      #         "project_ids": [
      #           38
      #         ]
      #       },
      #       "options": {
      #         "is_required": false,
      #         "items": "1, One\n2, Two"
      #       }
      #     }
      #   ],
      #   "include_all": true
      # }
      # client.add_case_field(opt)
    end
  end
end
