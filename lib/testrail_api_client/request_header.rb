require 'testrail_api/version'

module TestRail
  module RequestHeader
    # Default User-Agent header
    USER_AGENT ||= "TestRail API Ruby Gem #{TestRail::VERSION}".freeze

    # Default media type
    MEDIA_TYPE ||= 'application/json'.freeze

    # Default headers
    HEADERS    ||= {
        'Content-Type' => MEDIA_TYPE,
        'Accept'       => MEDIA_TYPE,
        'User-Agent'   => USER_AGENT
    }.freeze
  end
end