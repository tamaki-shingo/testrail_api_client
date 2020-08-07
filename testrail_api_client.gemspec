require_relative 'lib/testrail_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "testrail_api_client"
  spec.version       = TestrailApiClient::VERSION
  spec.authors       = ["Shingo Tamaki"]
  spec.email         = ["shingo.tamaki@gmail.com"]

  spec.summary       = "TestRail API V2 Wrapper in Ruby"
  spec.description   = "It's implimentation for TestRail API V2"
  spec.homepage      = "https://github.com/tamaki-shingo/testrail_api_client/wiki"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "Nothing"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tamaki-shingo/testrail_api_client"
  spec.metadata["changelog_uri"] = "Nothing yet"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
