# frozen_string_literal: true

require_relative "lib/flaresolverr"

Gem::Specification.new do |spec|
  spec.name = "flaresolverr"
  spec.version = FlareSolverr::VERSION
  spec.licenses = ["MIT"]
  spec.authors = ["Eddie Lebow"]
  spec.email = ["elebow@users.noreply.github.com"]

  spec.summary = "Ruby API for FlareSolverr proxy."
  spec.homepage = "https://github.com/elebow/ruby-flaresolverr"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["rubygems_mfa_required"] = "true"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/elebow/ruby-flaresolverr/blob/trunk/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.git)})
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "docker-api", "~> 2.0"
end
