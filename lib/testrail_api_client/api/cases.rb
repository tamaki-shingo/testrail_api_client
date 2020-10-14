# frozen_string_literal: true

module TestRailApiClient
  # Methods for the Cases API
  #
  # Use the following API methods to request details about test cases and to create or modify test cases.
  # @see https://www.gurock.com/testrail/docs/api/reference/cases
  module Cases
    def case(case_id)
      get("get_case/#{case_id}")
    end

    def cases(project_id, suite_id, filters = {})
      get("get_cases/#{project_id}&suite_id=#{suite_id}", {
        created_after: filters[:created_after],
        created_before: filters[:created_before],
        created_by: filters[:created_by].to_list,
        filter: filters[:filter],
        limit: filters[:limit],
        milestone_id: filters[:milestone_id].to_list,
        offset: filters[:offset],
        priority_id: filters[:priority_id].to_list,
        section_id: filters[:section_id],
        template_id: filters[:template_id].to_list,
        type_id: filters[:type_id].to_list,
        updated_after: filters[:updated_after],
        updated_before: filters[:updated_before],
        updated_by: filters[:updated_by].to_list
      })
    end

    def add_case(section_id, filters = {})
      post("add_case/#{section_id}", {
        title: filters[:title],
        type_id: filters[:type_id].to_list,
        priority_id: filters[:priority_id].to_list,
        estimate: filters[:estimate],
        milestone_id: filters[:milestone_id],
        refs: filters[:refs]
      })
    end

    def update_case(case_id, opt = {})
      post("update_case/#{case_id}", opt)
    end

    def delete_case(case_id)
      post("delete_case/#{case_id}")
    end
  end

  # Extensions
  module Cases
    def cases_ids(project_id, suite_id, filters = {})
      cases(project_id, suite_id, filters).map { |x| x['id'] }
    end

    def cases_by_title(title, project_id, suite_id, filters = {})
      cases(project_id, suite_id, filters).find { |test_case| test_case['title'] == title }
    end
  end
end
