module TestRail
  class Client
    # Methods for the Cases API
    #
    # Use the following API methods to request details about test cases and to create or modify test cases.
    # @see http://docs.gurock.com/testrail-api2/reference-cases
    module Cases
      # Returns an existing test case
      #
      # @param case_id [Integer, String] The ID of the test case
      # @return [Hash] an existing test case
      # @see http://docs.gurock.com/testrail-api2/reference-cases#get_case
      def case(case_id)
        get("get_case/#{case_id}")
      end

      #
      # Returns a list of test cases for a test suite or specific section in a test suite.
      #
      # @param project_id [Integer, String] The ID of the project the test run should be added to
      # @param suite_id [Integer, String] The ID of the test suite (optional if the project is operating in single suite mode)
      # @param filters [Hash] A customizable set of filters
      # @option filters [Integer, String]   :section_id       The ID of the section
      # @option filters [Integer, String]   :created_after    Only return test cases created after this date (as UNIX timestamp).
      # @option filters [Integer, String]   :created_before   Only return test cases created before this date (as UNIX timestamp).
      # @option filters [Array<Integer>]    :created_by       A comma-separated list of creators (user IDs) to filter by.
      # @option filters [Array<Integer>]    :milestone_id     A comma-separated list of milestone IDs to filter by (not available if the milestone field is disabled for the project).
      # @option filters [Array<Integer>]    :priority_id      A comma-separated list of priority IDs to filter by.
      # @option filters [Array<Integer>]    :type_id          A comma-separated list of case type IDs to filter by.
      # @option filters [Integer, String]   :updated_after    Only return test cases updated after this date (as UNIX timestamp).
      # @option filters [Integer, String]   :updated_before   Only return test cases updated before this date (as UNIX timestamp).
      # @option filters [Array<Integer>]    :updated_by       A comma-separated list of users who updated test cases to filter by.
      # @return a list of test cases for a test suite or specific section in a test suite.
      # The response includes an array of test cases.
      # Each test case in this list follows the same format as TestRail#Client#Cases#case
      # @see http://docs.gurock.com/testrail-api2/reference-cases#get_cases
      def cases(project_id, suite_id, filters = {})
        get("get_cases/#{project_id}&suite_id=#{suite_id}",
            params: {
                section_id:     filters[:section_id],
                created_after:  filters[:created_after],
                created_before: filters[:created_before],
                created_by:     filters[:created_by].to_list,
                milestone_id:   filters[:milestone_id].to_list,
                priority_id:    filters[:priority_id].to_list,
                type_id:        filters[:type_id].to_list,
                updated_after:  filters[:updated_after],
                updated_before: filters[:updated_before],
                updated_by:     filters[:updated_by].to_list
            })
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
      # @see http://docs.gurock.com/testrail-api2/reference-cases#add_case
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
end
