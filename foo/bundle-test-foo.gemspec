Gem::Specification.new do |s|
  s.name = "bundle-test-foo"
  s.version = ENV["FOO_VERSION"]
  s.summary = "bundle-test-foo"
  s.authors = "John Keiser"
  s.email = "jkeiser@chef.io"
  s.license = "Apache-2.0"
  s.homepage = "https://chef.io"
  s.add_dependency "bundle-test-bar", "~> 2.0"
end
