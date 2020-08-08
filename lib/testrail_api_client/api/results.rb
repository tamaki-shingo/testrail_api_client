# TODO: finish docs
module TestRail
  class Client
    # Methods for the Results API
    # Use the following API methods to request details about test results and to add new test results.
    #
    # @see http://docs.gurock.com/testrail-api2/reference-results
    module Results
      #
      # Returns a list of test results for a test.
      #
      # @param [Integer, String] test_id  The ID of the test
      # @return a list of test results for a test
      # @see http://docs.gurock.com/testrail-api2/reference-results#get_results
      def results(test_id)
        get("get_results/#{test_id}")
      end

      #
      # Returns a list of test results for a test run and case combination.
      # The difference to get_results is that this method expects a test run + test case instead of a test. In TestRail,
      # tests are part of a test run and the test cases are part of the related test suite.
      # So, when you create a new test run, TestRail creates a test for each test case found in the test suite of the run.
      # You can therefore think of a test as an “instance” of a test case which can have test results, comments and a test status.
      # Please also see TestRail's getting started guide for more details about the differences between test cases and tests.
      #
      # This method uses the same response format as get_results.
      #
      # :run_id	The ID of the test run
      # :case_id	The ID of the test case
      #
      def results_for_case(run_id, case_id)
        get("get_results_for_case/#{run_id}/#{case_id}")
      end

      #
      # Returns a list of test results for a test run.
      #
      # :run_id	The ID of the test run
      #
      def results_for_run(run_id)
        get("get_results_for_run/#{run_id}")
      end

      # TODO: add custom fields docs
      #
      # Adds a new test result, comment or assigns a test.
      # It's recommended to use #add_results instead if you plan to add results for multiple tests.
      #
      # @param [Integer, String] test_id  The ID of the test the result should be added to
      # @param data [Hash]: Optional query data
      # @option data [Integer, String] :status_id The ID of the test status. The built-in system statuses have the
      # following IDs:
      # 1 Passed
      # 2 Blocked
      # 3 Untested (not allowed when adding a result)
      # 4 Retest
      # 5 Failed
      # You can get a full list of system and custom statuses via #TestRail#Client#Statuses#get_statuses.
      # @option data [String] :comment The comment / description for the test result
      # @option data [String] :version The version or build you tested against
      # @option data [String] :elapsed The time it took to execute the test, e.g. "30s" or "1m 45s"
      # @option data [Array<Integer>, Array<String>] :defects A comma-separated list of defects to link to the test result
      # @option data [Integer, String] :assignedto_id The ID of a user the test should be assigned to
      # @return the new test result using the same response format as get_results, but with a single result instead of a list of results.
      # @see http://docs.gurock.com/testrail-api2/reference-results#add_result
      def add_result(test_id, data = {})
        post("add_result/#{test_id}", body: data.to_json)
      end

      #
      # Adds a new test result, comment or assigns a test (for a test run and case combination).
      # It's recommended to use add_results_for_cases instead if you plan to add results for multiple test cases.
      # The difference to add_result is that this method expects a test run + test case instead of a test.
      # In TestRail, tests are part of a test run and the test cases are part of the related test suite.
      # So, when you create a new test run, TestRail creates a test for each test case found in the test suite of the run.
      # You can therefore think of a test as an “instance” of a test case which can have test results, comments and a test status.
      # Please also see TestRail's getting started guide for more details about the differences between test cases and tests.
      #
      # This method supports the same POST fields as add_result.
      #
      # :run_id   The ID of the test run
      # :case_id  The ID of the test case
      #
      def add_result_for_case(run_id, case_id, data = {})
        post("add_result_for_case/#{run_id}/#{case_id}", body: data.to_json)
      end

      #
      # Adds a new test result, comment or assigns a test.
      # It's recommended to use add_results instead if you plan to add results for multiple tests.
      #
      # :run_id	The ID of the test run
      #
      def add_results(run_id, data = {})
        post("add_results/#{run_id}", body: data.to_json)
      end

      #
      # Adds one or more new test results, comments or assigns one or more tests (using the case IDs).
      # Ideal for test automation to bulk-add multiple test results in one step.
      #
      # :run_id The ID of the test run the results should be added to
      #
      def add_results_for_cases(run_id, data = {})
        post("add_results_for_cases/#{run_id}", body: data.to_json)
      end
    end
  end
end
