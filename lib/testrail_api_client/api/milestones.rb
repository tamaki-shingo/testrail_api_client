module TestRailApiClient
    # Methods for the Milestones API
    #
    # @see https://www.gurock.com/testrail/docs/api/reference/milestones
    module Milestones
        def milestone(milestone_id)
            get("get_milestone/#{milestone_id}")
        end

        def milestones(project_id)
            get("get_milestones/#{project_id}")
        end

        def add_milestone
            # TODO
        end

        def update_milestone
            # TODO
        end
        
        def delete_milestone
            # TODO
        end
    end
end