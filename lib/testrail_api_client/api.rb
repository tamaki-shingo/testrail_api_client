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
    module API
    #   include TestRailApiClient::CaseFields
    #   include TestRailApiClient::CaseTypes
    #   include TestRailApiClient::Cases
    #   include TestRailApiClient::Milestones
    #   include TestRailApiClient::Plans
    #   include TestRailApiClient::Priorities
        include TestRailApiClient::Projects
    #   include TestRailApiClient::ResultFields
    #   include TestRailApiClient::Results
    #   include TestRailApiClient::Runs
    #   include TestRailApiClient::Sections
    #   include TestRailApiClient::Statuses
    #   include TestRailApiClient::Suites
    #   include TestRailApiClient::Tests
    #   include TestRailApiClient::Users
    end
end