module TestRailApiClient
  # Methods for the Attachments API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/attachments
  module Attachments
    def add_attachment_to_plan(plan_id, path)
      post("add_attachment_to_plan/#{plan_id}", path)
    end

    def add_attachment_to_plan_entry(plan_id, entry_id, path)
      post("add_attachment_to_plan_entry/#{plan_id}/#{entry_id}", path)
    end

    def add_attachment_to_result(result_id, path)
      post("add_attachment_to_result/#{result_id}", path)
    end

    def add_attachment_to_run(run_id, path)
      post("add_attachment_to_run/#{run_id}", path)
    end

    def get_attachments_for_case(case_id)
      get("get_attachments_for_case/#{case_id}")
    end

    def get_attachments_for_plan(plan_id)
      get("get_attachments_for_plan/#{plan_id}")
    end

    def get_attachments_for_plan_entry(plan_id, entry_id)
      get("get_attachments_for_plan_entry/#{plan_id}/#{entry_id}")
    end

    def get_attachments_for_run(run_id)
      get("get_attachments_for_run/#{run_id}")
    end

    def get_attachments_for_test(test_id)
      get("get_attachments_for_test/#{test_id}")
    end

    def get_attachment(attachment_id)
      get("get_attachment/#{attachment_id}")
    end

    def delete_attachment(attachment_id)
      post("delete_attachment/#{attachment_id}")
    end
  end
end
