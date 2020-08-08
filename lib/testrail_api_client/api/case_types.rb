module TestRail
  class Client
    # Methods for the Case Types API
    #
    # Use the following API methods to request details about custom types for test cases.
    # @see http://docs.gurock.com/testrail-api2/reference-cases-types
    module CaseTypes
      # List all available test case custom types
      #
      # @return [Array<Hash>] a list of available test case custom types
      # @see http://docs.gurock.com/testrail-api2/reference-cases-types#get_case_types
      def case_types
        get('get_case_types')
      end
    end
  end
end

