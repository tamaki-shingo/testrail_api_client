module TestRailApiClient
    # Methods for the Cases API
    #
    # Use the following API methods to request details about test cases and to create or modify test cases.
    # @see https://www.gurock.com/testrail/docs/api/reference/cases
    module Cases
        # Returns an existing test case
        #
        # @param case_id [Integer, String] The ID of the test case
        # @return [Hash] an existing test case
        # @see https://www.gurock.com/testrail/docs/api/reference/cases#get_case
        def case(case_id)
            get("get_case/#{case_id}")
        end

        # :created_after	timestamp	Only return test cases created after this date (as UNIX timestamp).
        # :created_before	timestamp	Only return test cases created before this date (as UNIX timestamp).
        # :created_by	integer (list)	A comma-separated list of creators (user IDs) to filter by.
        # :filter	string	Only return cases with matching filter string in the case title
        # :limit	integer	The number of test cases the response should return
        # :milestone_id	integer (list)	A comma-separated list of milestone IDs to filter by (not available if the milestone field is disabled for the project).
        # :offset	integer	Where to start counting the tests cases from (the offset)
        # :priority_id	integer (list)	A comma-separated list of priority IDs to filter by.
        # :section_id	integer	The ID of a test case section
        # :template_id	integer (list)	A comma-separated list of template IDs to filter by (requires TestRail 5.2 or later)
        # :type_id	integer (list)	A comma-separated list of case type IDs to filter by.
        # :updated_after	timestamp	Only return test cases updated after this date (as UNIX timestamp).
        # :updated_before	timestamp	Only return test cases updated before this date (as UNIX timestamp).
        # :updated_by	integer (list)	A comma-separated list of user IDs who updated test cases to filter by.        
        # @see https://www.gurock.com/testrail/docs/api/reference/cases#get_cases
        def cases(project_id, suite_id, filters = {})
            get("get_cases/#{project_id}&suite_id=#{suite_id}",
                {
                    created_after:  filters[:created_after],
                    created_before: filters[:created_before],
                    created_by:     filters[:created_by].to_list,
                    filter:         filters[:filter],
                    limit:          filters[:limit],
                    milestone_id:   filters[:milestone_id].to_list,
                    offset:         filters[:offset],
                    priority_id:    filters[:priority_id].to_list,
                    section_id:     filters[:section_id],
                    template_id:    filters[:template_id].to_list,
                    type_id:        filters[:type_id].to_list,
                    updated_after:  filters[:updated_after],
                    updated_before: filters[:updated_before],
                    updated_by:     filters[:updated_by].to_list
                }
            )
        end

        #
        # Creates a new test case.
        #
        # @param section_id [Integer, String] The ID of the section the test case should be added to
        # @param filters [Hash] A customizable set of filters
        # @option filters [String]            :title          The title of the test case (required)
        # @option filters [Integer]           :type_id        The ID of the case type
        # @option filters [Integer]           :priority_id    The ID of the case priority
        # @option filters [String, Integer]   :estimate       The estimate, e.g. "30s" or "1m 45s"
        # @option filters [Integer]           :milestone_id   The ID of the milestone to link to the test case
        # @option filters [String]            :refs           A comma-separated list of references/requirements
        # @return [Hash] created case
        # TODO: finish custom fields
        # @see https://www.gurock.com/testrail/docs/api/reference/cases#add_case
        def add_case(section_id, filters = {})
            post("add_case/#{section_id}",
                  body: {
                            title:        filters[:title],
                            type_id:      filters[:type_id].to_list,
                            priority_id:  filters[:priority_id].to_list,
                            estimate:     filters[:estimate],
                            milestone_id: filters[:milestone_id],
                            refs:         filters[:refs]
                        }.to_json)
        end

        # @return [Array] array of cases IDs using TestRail#Client#Case#cases method (parameters are the same)
        def cases_ids(project_id, suite_id, filters = {})
          cases(project_id, suite_id, filters).map { |x| x['id'] }
        end

        def cases_by_title(title, project_id, suite_id, filters = {})
          cases(project_id, suite_id, filters).find { |test_case| test_case['title'] == title }
        end

        # Updates an existing test case (partial updates are supported, i.e. you can submit and update specific fields only).
        # This method supports the same POST fields as TestRail#Client#Case#add_case (except section_id)
        def update_case(case_id, body = {})
            body[:type_id]     = body[:type_id].to_list if body[:type_id]
            body[:priority_id] = body[:priority_id].to_list if body[:type_id]
            post("update_case/#{case_id}", body: body.to_json)
        end

        # Deletes an existing test case.
        # Please note: Deleting a test case cannot be undone and also permanently deletes all test results in active test
        # runs (i.e. test runs that haven't been closed (archived) yet).
        #
        # @param case_id [Integer, String] The ID of the test case
        def delete_case(case_id)
            post("delete_case/#{case_id}")
        end
    end
end