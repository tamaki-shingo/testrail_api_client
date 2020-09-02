module TestRailApiClient
    # Methods for the Sections API
    #
    # @see https://www.gurock.com/testrail/docs/api/reference/statuses#get_statuses
    module Statuses
        def statuses
            get('get_statuses')
        end
    end
end