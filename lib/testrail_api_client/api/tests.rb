module TestRail
  class Client
    # Methods for the Tests API
    # Use the following API methods to request details about tests.
    #
    # @see http://docs.gurock.com/testrail-api2/reference-tests
    module Tests
      #
      # Returns an existing test by its ID
      #
      # @param [Integer, String] test_id  The ID of the test
      # @return an existing test by its ID
      # @see http://docs.gurock.com/testrail-api2/reference-runs#add_run
      def test(test_id)
        get("get_test/#{test_id}")
      end

      # TODO: add documentation
      def test_by_title(run_id, test_title)
        tests(run_id).find { |test| test['title'].casecmp(test_title) == 0 }
      end

      # TODO: add documentation
      def test_id_by_title(run_id, test_title)
        test_by_title(run_id, test_title)['id']
      end

      #
      # Returns a list of tests for a test run.
      #
      # TODO: finish method and documentation
      # @param [Integer, String] run_id The ID of the test run
      # @option [String] status_id
      # @return an existing test by its ID
      # @see http://docs.gurock.com/testrail-api2/reference-runs#add_run
      def tests(run_id)
        get("get_tests/#{run_id}")
      end
    end
  end
end
