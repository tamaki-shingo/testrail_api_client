module TestRail
  class Client
    # Methods for the Runs API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-runs
    # Use the following API methods to request details about test runs and to create or modify test runs.
    module Runs
      #
      # Returns an existing test run. Please see get_tests for the list of included tests in this run.
      #
      # :run_id  The ID of the test run
      #
      def run(run_id)
        get("get_run/#{run_id}")
      end

      #
      # Returns a list of test runs for a project.
      # Only returns those test runs that are not part of a test plan (please see get_plans/get_plan for this).
      #
      # :project_id  The ID of the project
      #
      def runs(project_id)
        get("get_runs/#{project_id}")
      end

      #
      # Creates a new test run.
      #
      # @param [Integer, String] project_id  The ID of the project the test run should be added to
      # @param data [Hash]: A customizable set of options
      # @option data [Integer]          :suite_id       The ID of the test suite for the test run (optional if the project is operating in single suite mode, required otherwise)
      # @option data [String]           :name           The name of the test run
      # @option data [String]           :description    The description of the test run
      # @option data [Integer]          :milestone_id   The ID of the milestone to link to the test run
      # @option data [Integer]          :assignedto_id  The ID of the user the test run should be assigned to
      # @option data [Boolean]          :include_all    True for including all test cases of the test suite and false for a custom case selection (default: true)
      # @option data [Array<Integer>]   :case_ids       An array of case IDs for the custom case selection
      # @return # TODO:
      # @see http://docs.gurock.com/testrail-api2/reference-runs#add_run
      def add_run(project_id, data = {})
        post("add_run/#{project_id}", body: data.to_json)
      end

      #
      # Updates an existing test run (partial updates are supported, i.e. you can submit and update specific fields only).
      # With the exception of the suite_id and assignedto_id fields, this method supports the same POST fields as add_run.
      #
      # :run_id    The ID of the test run
      #
      def update_run(run_id, data = {})
        post("update_run/#{run_id}", body: data.to_json)
      end

      #
      # Closes an existing test run and archives its tests & results.
      #
      # :run_id The ID of the test run
      #
      def close_run(run_id)
        post("close_run/#{run_id}")
      end

      #
      # Deletes an existing test run.
      #
      # :run_id The ID of the test run
      #
      def delete_run(run_id)
        post("delete_run/#{run_id}")
      end
    end
  end
end
