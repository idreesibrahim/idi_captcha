require_relative 'lib/idi_captcha/version'

Gem::Specification.new do |spec|
  spec.name          = "idi_captcha"
  spec.version       = IdiCaptcha::VERSION
  spec.authors = ["idrees ibrahim"]
  spec.email = ["idrees.ibrahim@pitb.gov.pk"]

  spec.summary       = "Offline CAPTCHA for Rails apps"
  spec.description   = "A simple image-based CAPTCHA engine for Rails 6+, works offline and supports Devise integration"
  spec.homepage      = "https://rubygems.org/gems/idi_captcha"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  
  spec.metadata['base_path'] = File.expand_path('..', __FILE__)
 
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = "Nonstandard"
end