# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "prtc09"
  spec.version       = "0.0.1"
  spec.authors       = ["Ramon Mesa", "Natalia Gutierrez"]
  spec.email         = ["alu0100705713@ull.edu.es", "alu0100695595@ull.edu.es"]
  spec.description   = %q{}
  spec.summary       = %q{}
  spec.homepage      = "https://github.com/alu0100695595/prtc09"
  spec.license       = "MIT"
 
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end