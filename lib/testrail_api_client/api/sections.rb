# frozen_string_literal: true

module TestRailApiClient
  # Methods for the Sections API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/sections
  module Sections
    def section(section_id)
      get("get_section/#{section_id}")
    end

    def sections(project_id, suite_id)
      get("get_sections/#{project_id}&suite_id=#{suite_id}")
    end

    def section_by_name(project_id, suite_id, section_name)
      sections(project_id, suite_id).find { |section| section['name'] == section_name }
    end

    def add_section(project_id, opt)
      post("add_section/#{project_id}", opt)
    end

    def update_section(section_id, opt)
      post("update_section/#{section_id}", opt)
    end

    def delete_section(section_id)
       post("delete_section/#{section_id}")
    end
  end
end
