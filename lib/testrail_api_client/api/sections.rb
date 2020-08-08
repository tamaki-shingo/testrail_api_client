module TestRail
  class Client
    # Methods for the Sections API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-sections
    # Use the following API methods to request details about sections and to create or modify sections.
    # Sections are used to group and organize test cases in test suites.
    module Sections
      #
      # Returns an existing section.
      #
      # :section_id The ID of the section
      #
      def section(section_id)
        get("get_section/#{section_id}")
      end

      #
      # Returns a list of sections for a project and test suite.
      #
      # :project_id The ID of the project
      # :suite_id The ID of the test suite (optional if the project is operating in single suite mode)
      #
      def sections(project_id, suite_id)
        get("get_sections/#{project_id}&suite_id=#{suite_id}")
      end

      def section_by_name(project_id, suite_id, section_name)
        sections(project_id, suite_id).find { |section| section['name'] == section_name }
      end

      #
      # Creates a new section.
      #
      # :project_id The ID of the project
      #
      def add_section(project_id, data = {})
        post("add_section/#{project_id}", body: data.to_json)
      end

      #
      # Updates an existing section (partial updates are supported, i.e. you can submit and update specific fields only).
      #
      # :section_id The ID of the section
      #
      def update_section(section_id, data = {})
        post("update_section/#{section_id}", body: data.to_json)
      end

      #
      # Updates an existing section (partial updates are supported, i.e. you can submit and update specific fields only).
      # Please note: Deleting a section cannot be undone and also deletes all related test cases
      # as well as active tests & results, i.e. tests & results that weren't closed (archived) yet.
      #
      # :section_id The ID of the section
      #
      def delete_section(section_id)
        post("delete_section/#{section_id}")
      end
    end
  end
end
