# Methods for the Case Fields API
#
# Use the following API methods to request details about custom fields for test cases.
# @see https://www.gurock.com/testrail/docs/api/reference/cases-fields
module CaseFields
  # List all available test case custom fields
  #
  # @return [Array<Hash>] a list of available test case custom fields
  # @see https://www.gurock.com/testrail/docs/api/reference/cases-fields#get_case_fields
  def case_fields
    get('get_case_fields')
  end
end
