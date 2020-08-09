# Methods for the Priorities API
#
# @see https://www.gurock.com/testrail/docs/api/reference/priorities
module Priorities
  #
  # Returns a list of available priorities
  #
  def priorities
    get('get_priorities')
  end
end
