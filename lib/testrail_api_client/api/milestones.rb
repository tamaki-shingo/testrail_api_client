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

        # Parameters
        # Name          Type        Description
        # name          string      The name of the milestone (required)
        # description   string      The description of the milestone
        # due_on        timestamp   The due date of the milestone (as UNIX timestamp)
        # parent_id     int         The ID of the parent milestone, if any (for sub-milestones) (available since TestRail 5.3)
        # refs          string      A comma-separated list of references/requirements (available since TestRail 6.4)
        # start_on      timestamp   The scheduled start date of the milestone (as UNIX timestamp) (available since TestRail 5.3)
        def add_milestone(project_id, opt)
            post("add_milestone/#{project_id}", opt)
        end

        def update_milestone
            # TODO
        end
        
        def delete_milestone
            # TODO
        end
    end
end