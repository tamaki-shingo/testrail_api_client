# frozen_string_literal: true

module TestRailApiClient
  # Methods for the Case Fields API
  #
  # Use the following API methods to request details about custom fields for test cases.
  # @see https://www.gurock.com/testrail/docs/api/reference/case-fields
  module CaseFields
    def case_fields
      get('get_case_fields')
    end

    def add_case_field(opt)
      post('add_case_field', opt)
    end
  end
end
