module TestRail
  class Client
    # Methods for the Statuses API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-statuses
    # Use the following API methods to request details about test statuses.
    # Each status has a unique ID, a name (system name) as well as a label (display name).
    # The color related fields specify the different colors used for a status and are RGB colors.
    # The following system statuses are available by default.
    # You can add additional custom statuses under Administration > Customizations in TestRail.
    module Statuses
      #
      # @return a list of available_contexts test statuses.
      # @see http://docs.gurock.com/testrail-api2/reference-statuses#get_statuses
      def statuses
        get('get_statuses')
      end
    end
  end
end
