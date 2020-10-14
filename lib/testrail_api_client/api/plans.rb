# frozen_string_literal: true

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

    def add_plan(project_id, opt)
      post("add_plan/#{project_id}", opt)
    end

    def add_plan_entry(plan_id, opt)
      post("add_plan_entry/#{plan_id}", opt)
    end

    def add_run_to_plan_entry(plan_id, entry_id, opt)
      post("add_run_to_plan_entry/#{plan_id}/#{entry_id}", opt)
    end

    def update_plan(plan_id)
      post("update_plan/#{plan_id}", opt)
    end

    def update_plan_entry(plan_id, entry_id, opt)
      post("update_plan_entry/#{plan_id}/#{entry_id}", opt)
    end

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
