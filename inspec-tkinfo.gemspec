# coding: utf-8

# As plugins are usually packaged and distributed as a RubyGem,
# we have to provide a .gemspec file, which controls the gembuild
# and publish process.  This is a fairly generic gemspec.

# It is traditional in a gemspec to dynamically load the current version
# from a file in the source tree.  The next three lines make that happen.
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec-tkinfo/version"

Gem::Specification.new do |spec|
  # Importantly, all InSpec plugins must be prefixed with `inspec-` (most
  # plugins) or `train-` (plugins which add new connectivity features).
  spec.name          = "inspec-tkinfo"

  # It is polite to namespace your plugin under InspecPlugins::YourPluginInCamelCase
  spec.version       = InspecPlugins::TKInfo::VERSION
  spec.authors       = ["Thomas Heinen"]
  spec.email         = ["theinen@tecracer.de"]
  spec.summary       = "InSpec plugin to retrieve Test Kitchen data as inputs."
  spec.description   = "Allows reading instance name, suite name and platform name in tests."
  spec.homepage      = "https://github.com/tecracer-theinen/inspec-tkinfo"
  spec.license       = "Apache-2.0"

  # Though complicated-looking, this is pretty standard for a gemspec.
  # It just filters what will actually be packaged in the gem (leaving
  # out tests, etc)
  spec.files = %w{
    README.md inspec-tkinfo.gemspec Gemfile
  } + Dir.glob(
    "lib/**/*", File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bump", "~> 0.8"
  spec.add_development_dependency "minitest", "~> 5.11"
end
