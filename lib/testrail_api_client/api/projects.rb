# frozen_string_literal: true

module TestRailApiClient
  # Methods for the Projects API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/projects
  module Projects
    def project(project_id)
      get("get_project/#{project_id}")
    end

    def projects
      get('get_projects')
    end

    def add_project(opt)
      post('add_project', opt)
    end

    def update_project(project_id, opt)
      post("update_project/#{project_id}", opt)
    end

    def delete_project(project_id)
      post("delete_project/#{project_id}")
    end
  end

  # Extensions
  module Projects
    # Returns the list of available projects ids
    def projects_ids
      projects.map { |x| x['id'] }
    end

    #
    # Returns an existing project by its name.
    #
    # :project_name  The name of the project
    #
    def project_by_name(project_name)
      projects.find { |project| project['name'].casecmp(project_name).zero? }
    end
  end
end
