module TestRailApiClient
    # Methods for the Results API
    #
    # @see https://www.gurock.com/testrail/docs/api/reference/results
    module Results
        def results(test_id)
            get("get_results/#{test_id}")
        end

        def results_for_case(run_id, case_id)
            get("get_results_for_case/#{run_id}/#{case_id}")
        end

        def results_for_run(run_id)
            get("get_results_for_run/#{run_id}")
        end

        def add_result(test_id, opt)
            post("add_result/#{test_id}", opt)
        end

        def add_result_for_case(run_id, case_id, opt)
            post("add_result_for_case/#{run_id}/#{case_id}", opt)
        end

        def add_results(run_id, opt)
            post("add_results/#{run_id}", opt)
        end

        def add_results_for_cases(run_id, opt)
            post("add_results_for_cases/#{run_id}", opt)
        end
    end
end