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

        # Parameters
        # is_completed  bool	    True if a milestone is considered completed and false otherwise
        # is_started    bool	    True if a milestone is considered started and false otherwise
        # parent_id     int	        The ID of the parent milestone, if any (for sub-milestones) (available since TestRail 5.3)
        # start_on      timestamp   The scheduled start date of the milestone (as UNIX timestamp) (available since TestRail 5.3)
        def update_milestone(milestone_id, opt)
            post("update_milestone/#{milestone_id}", opt)
        end
        
        def delete_milestone(milestone_id)
            post("delete_milestone/#{milestone_id}")
        end
    end
end