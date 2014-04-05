Gem::Specification.new do |s|
  s.name = "capistrano_two_phase_deployment"
  s.version = "0.0.1"

  s.required_ruby_version = ">= 2.0.0"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Riedel"]
  s.date = %q{2014-04-05}
  s.description = %q{Deploy with tar files via an intermediary host}
  s.add_dependency( 'capistrano',           '~> 3.1.0' )

  s.summary = %q{Allows Capistrano 3 to deploy tar archives via an intermediary host; servers no longer need to have an SCM client installed}
  s.email = %q{sr@gimp.org}
  s.homepage = %q{http://github.com/sriedel/capistrano_two_phase_deployment}

  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]

  s.extra_rdoc_files = %W{ README }
  s.files = %W{ README
                lib/capistrano/intermediate_host.rb
                lib/capistrano/tasks/deploy.cap
                lib/capistrano/tasks/intermediate_host.cap
              }
end
