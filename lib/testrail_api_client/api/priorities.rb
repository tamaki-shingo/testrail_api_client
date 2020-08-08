module TestRail
  class Client
    # Methods for the Priorities API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-priorities
    module Priorities
      #
      # Returns a list of available priorities
      #
      def priorities
        get('get_priorities')
      end
    end
  end
end
