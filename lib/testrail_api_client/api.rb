# require 'testrail_api_client/api/case_fields'
# require 'testrail_api_client/api/case_types'
# require 'testrail_api_client/api/cases'
# require 'testrail_api_client/api/milestones'
# require 'testrail_api_client/api/plans'
# require 'testrail_api_client/api/priorities'
require 'testrail_api_client/api/projects'
# require 'testrail_api_client/api/result_fields'
# require 'testrail_api_client/api/results'
# require 'testrail_api_client/api/runs'
# require 'testrail_api_client/api/sections'
# require 'testrail_api_client/api/statuses'
# require 'testrail_api_client/api/suites'
# require 'testrail_api_client/api/tests'
# require 'testrail_api_client/api/users'

module TestRailApiClient
  class Client
    module API
    #   include TestRailAPIClient::Client::CaseFields
    #   include TestRailAPIClient::Client::CaseTypes
    #   include TestRailAPIClient::Client::Cases
    #   include TestRailAPIClient::Client::Milestones
    #   include TestRailAPIClient::Client::Plans
    #   include TestRailAPIClient::Client::Priorities
      include TestRailAPIClient::Client::Projects
    #   include TestRailAPIClient::Client::ResultFields
    #   include TestRailAPIClient::Client::Results
    #   include TestRailAPIClient::Client::Runs
    #   include TestRailAPIClient::Client::Sections
    #   include TestRailAPIClient::Client::Statuses
    #   include TestRailAPIClient::Client::Suites
    #   include TestRailAPIClient::Client::Tests
    #   include TestRailAPIClient::Client::Users
    end
  end
end