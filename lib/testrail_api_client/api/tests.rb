module TestRailApiClient
  # Methods for the Tests API
  #
  # @see https://www.gurock.com/testrail/docs/api/reference/tests
  module Tests
    def test(test_id)
      get("get_test/#{test_id}")
    end

    def test_by_title(run_id, test_title)
      tests(run_id).find { |test| test['title'].casecmp(test_title) == 0 }
    end

    def test_id_by_title(run_id, test_title)
       test_by_title(run_id, test_title)['id']
    end
    
    def tests(run_id)
      get("get_tests/#{run_id}")
    end
  end
end