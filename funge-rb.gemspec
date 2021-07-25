Gem::Specification.new do |spec|
  spec.name        = 'funge-rb'
  spec.version     = Funge::VERSION
  spec.licenses    = ['MIT']
  spec.summary     = "A simple funge interpreter for Funge-98"
  spec.description = "A simple funge interpreter for Funge-98"
  spec.authors     = ["questionmarkexclamationpoint"]
  spec.email       = 'questionmarkexclamationpoint@github.com'
  spec.files       = ["lib/**/*"]
  spec.executables = ['bin/funge-rb']
  spec.homepage    = 'https://github.com/questionmarkexclamationpoint'
end