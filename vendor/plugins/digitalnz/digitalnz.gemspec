# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{digitalnz}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Harton"]
  s.date = %q{2009-03-20}
  s.email = %q{jamesotron@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/digitalnz", "lib/digitalnz/record.rb", "lib/digitalnz/search.rb", "lib/digitalnz/version.rb", "lib/digitalnz.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jamesotron/digitalnz/tree/master}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{digitalnz}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A small gem to interface with the DigitalNZ API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
