module TestRailApiClient
    # Methods for the Plans API
    #
    # @see https://www.gurock.com/testrail/docs/api/reference/plans
    module Plans
        def plan(plan_id)
            get("get_plan/#{plan_id}")
        end

        def plans(project_id)
            get("get_plans/#{project_id}")
        end

        # name          string  The name of the test plan (required)
        # description   string  The description of the test plan
        # milestone_id  int     The ID of the milestone to link to the test plan
        # entries       array   An array of objects describing the test runs of the plan, see the example below and add_plan_entry
        def add_plan(project_id, opt)
            post("add_plan/#{project_id}", opt)
        end

        # Parameters
        # suite_id	int	The ID of the test suite for the test run(s) (required)
        # name	string	The name of the test run(s)
        # description	string	The description of the test run(s) (requires TestRail 5.2 or later)
        # assignedto_id	int	The ID of the user the test run(s) should be assigned to
        # include_all	bool	True for including all test cases of the test suite and false for a custom case selection (default: true)
        # case_ids	array	An array of case IDs for the custom case selection
        # config_ids	array	An array of configuration IDs used for the test runs of the test plan entry
        # refs	string	A string of external requirement IDs, separated by commas. (requires TestRail 6.3 or later)
        # runs	array	An array of test runs with configurations, please see the example below for details
        def add_plan_entry(plan_id, opt)
            post("add_plan_entry/#{plan_id}", opt)
        end

        # Parameters
        # config_ids	array	An array of configuration IDs used for the test run of the test plan entry (Required)
        # description	text	The description of the test run
        # assignedto_id	int	The ID of the user the test run should be assigned to
        # include_all	bool	True for including all test cases of the test suite and false for a custom case selection
        # case_ids	array	An array of case IDs for the custom case selection (Required if include_all is false)
        # refs	string	A comma-separated list of references/requirements        
        def add_run_to_plan_entry(plan_id, entry_id, opt)
            post("add_run_to_plan_entry/#{plan_id}/#{entry_id}", opt)
        end

        # Parameters
        # With the exception of the entries field, this method supports the same POST fields as add_plan.
        def update_plan(plan_id)
            post("update_plan/#{plan_id}", opt)
        end

        # Parameters
        # name	string	The name of the test run(s)
        # description	string	The description of the test run(s) (requires TestRail 5.2 or later)
        # assignedto_id	int	The ID of the user the test run(s) should be assigned to
        # include_all	bool	True for including all test cases of the test suite and false for a custom case selection (default: true)
        # case_ids	array	An array of case IDs for the custom case selection
        # refs	string	A string of external requirement IDs, separated by commas. (requires TestRail 6.3 or later)
        def update_plan_entry(plan_id, entry_id, opt)
            post("update_plan_entry/#{plan_id}/#{entry_id}", opt)
        end

        # Prameters
        # description	text	The description of the test run
        # assignedto_id	int	The ID of the user the test run should be assigned to
        # include_all	bool	True for including all test cases of the test suite and false for a custom case selection
        # case_ids	array	An array of case IDs for the custom case selection. (Required if include_all is false)
        # refs	string	A comma-separated list of references/requirements
        def update_run_in_plan_entry(run_id, opt)
            post("update_run_in_plan_entry/#{plan_id}/#{run_id}", opt)
        end

        def close_plan(plan_id)
            post("close_plan/#{plan_id}")
        end

        def delete_plan(plan_id)
            post("delete_plan/#{plan_id}")
        end

        def delete_plan_entry(plan_id, entry_id)
            post("delete_plan_entry/#{plan_id}/#{entry_id}")
        end

        def delete_run_from_plan_entry(run_id)
            post("delete_run_from_plan_entry/#{run_id}")
        end
    end
end