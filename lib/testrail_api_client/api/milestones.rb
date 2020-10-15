# frozen_string_literal: true

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

    def add_milestone(project_id, opt)
      post("add_milestone/#{project_id}", opt)
    end

    def update_milestone(milestone_id, opt)
      post("update_milestone/#{milestone_id}", opt)
    end

    def delete_milestone(milestone_id)
      post("delete_milestone/#{milestone_id}")
    end
  end
end
