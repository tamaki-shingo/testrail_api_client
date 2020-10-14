module TestRailApiClient
  # Methods for the Suites API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/suites
  module Suites
    def suite(suite_id)
      get("get_suite/#{suite_id}")
    end

    def suite_by_name(project_id, suite_name)
      suites(project_id).find { |suite| suite['name'].casecmp(suite_name) == 0 }
    end

    def suites(project_id)
      get("get_suites/#{project_id}")
    end

    def suites_by_project_name(project_name)
      project_id = project_by_name(project_name).fetch('id')
      suites(project_id)
    end

    def add_suite(project_id, opt)
      post("add_suite/#{project_id}", opt)
    end
  end
end