module TestRail
  class Client
    # Methods for the Suites API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-suites
    # Use the following API methods to request details about test suites and to create or modify test suites.
    module Suites
      #
      # Returns an existing test suite.
      #
      # :suite_id	The ID of the test suite
      #
      def suite(suite_id)
        get("get_suite/#{suite_id}")
      end

      def suite_by_name(project_id, suite_name)
        suites(project_id).find { |suite| suite['name'].casecmp(suite_name) == 0 }
      end

      #
      # Returns a list of test suites for a project.
      #
      # :project_id	The ID of the project
      #
      def suites(project_id)
        get("get_suites/#{project_id}")
      end

      def suites_by_project_name(project_name)
        project_id = project_by_name(project_name).fetch('id')
        suites(project_id)
      end

      #
      # Creates a new test suite.
      #
      # :project_id	The ID of the project the test suite should be added to
      #
      def add_suite(project_id, data = {})
        post("add_suite/#{project_id}", body: data.to_json)
      end
    end
  end
end
