require 'testrail_api_client/gurock/testrail'
require 'testrail_api_client/version'
require 'testrail_api_client/api'
require 'testrail_api_client/request_header'
require 'typhoeus'
require 'json'  

module TestrailApiClient
  class Client
    include TestRail::TestrailApiClient

    def initialize(url, email, password)
      @url       = url
      @email     = email
      @password  = password
      @scheme    = 'https' 
    end

    def api_endpoint
      @api_endpoint ||= File.join("#{scheme}://#{@server}", 'index.php?api/v2')
    end

    def user_agent
      @user_agent ||= "TestRail API v2 Client #{TestRail::VERSION}"
    end

    def get(path, opts = {})
      request(:get, path, opts)
    end

    def post(path, opts = {})
      request(:post, path, opts)
    end

    def credentials
      "#{@email}:#{@password}"
    end

    def request(method, path, opts = {})
      body = Typhoeus::Request.new(
        File.join(api_endpoint, path),
          { method:  method,
            headers: RequestHeader::HEADERS,
            userpwd: credentials
          }.merge(opts)
      ).run.body
      JSON.parse(body)
    rescue JSON::ParserError
      body
    end
  end
  class Error < StandardError; end
end
