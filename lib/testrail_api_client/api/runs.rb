# frozen_string_literal: true

module TestRailApiClient
  # Methods for the Runs API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/runs
  module Runs
    def run(run_id)
      get("get_run/#{run_id}")
    end

    def runs(project_id)
      get("get_runs/#{project_id}")
    end

    def add_run(project_id, opt)
      post("add_run/#{project_id}", opt)
    end

    def update_run(run_id, opt)
      post("update_run/#{run_id}", opt)
    end

    def close_run(run_id)
      post("close_run/#{run_id}")
    end

    def delete_run(run_id)
      post("delete_run/#{run_id}")
    end
  end
end
