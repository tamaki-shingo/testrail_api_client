module TestRail
  class Client
    # Methods for the Case Fields API
    #
    # Use the following API methods to request details about custom fields for test cases.
    # @see http://docs.gurock.com/testrail-api2/reference-cases-fields
    module CaseFields
      # List all available test case custom fields
      #
      # @return [Array<Hash>] a list of available test case custom fields
      # @see http://docs.gurock.com/testrail-api2/reference-cases-fields#get_case_fields
      def case_fields
        get('get_case_fields')
      end
    end
  end
end
