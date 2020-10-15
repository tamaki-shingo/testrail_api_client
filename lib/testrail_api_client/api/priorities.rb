# frozen_string_literal: true

module TestRailApiClient
  # Methods for the Priorities API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/priorities
  module Priorities
    def priorities
      get('get_priorities')
    end
  end
end
