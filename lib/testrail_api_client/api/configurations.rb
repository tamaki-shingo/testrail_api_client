module TestRailApiClient
  # Methods for the Configurations API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/configurations
  module Configurations
    def configs(project_id)
      get("get_configs/#{project_id}")  
    end

    def add_config_group(project_id, name)
      post("add_config_group/#{project_id}", {"name": name})
    end

    def add_config(config_group_id, name)
      post("add_config/#{config_group_id}", {"name": name})
    end

    def update_config_group(config_group_id, name)
      post("update_config_group/#{config_group_id}", {"name": name})
    end
    
    def update_config(config_id, name)
      post("update_config/#{config_id}", {"name": name})
    end

    def delete_config_group(config_group_id)
      post("delete_config_group/#{config_group_id}")
    end

    def delete_config(config_id)
      post("delete_config/#{config_id}")
    end
  end
end