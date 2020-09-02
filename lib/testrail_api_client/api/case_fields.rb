module TestRailApiClient
    # Methods for the Case Fields API
    #
    # Use the following API methods to request details about custom fields for test cases.
    # @see https://www.gurock.com/testrail/docs/api/reference/cases-fields
    module CaseFields
        def case_fields
            get('get_case_fields')
        end
    end
end