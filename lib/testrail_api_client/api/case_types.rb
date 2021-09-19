# frozen_string_literal: true

module TestRailApiClient
  # Methods for the Case Types API
  #
  # Use the following API methods to request details about custom types for test cases.
  # @see https://www.gurock.com/testrail/docs/api/reference/case-types
  module CaseTypes
    def case_types
      get('get_case_types')
    end
  end
end
