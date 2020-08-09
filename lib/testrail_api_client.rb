require 'testrail_api_client/gurock/testrail'
require 'testrail_api_client/version'
require 'testrail_api_client/api'

module TestRailApiClient
  class Client
    include API

    def initialize(url, user, password)
      @url      = url
      @user     = user
      @password = password
    end

    def get(path)
      testrail.send_get(path)
    end

    def post(path, opts = {})
      testrail.send_post(path, opts)
    end

    private
    def testrail
      testrail = TestRail::APIClient.new(@url)
      testrail.user = @user
      testrail.password = @password
      return testrail
    end
  end
  class Error < StandardError; end
end
