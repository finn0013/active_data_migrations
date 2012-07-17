# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_data_migrations/version"

Gem::Specification.new do |s|

    s.name = "active_data_migrations"
    s.version = ActiveDataMigrations::VERSION

    s.author = "Jason McDonald"
    s.email = "jason@mcdonaldland.info"
    s.homepage = "http://www.McDonaldLand.info"

    s.summary = "Utilizing ActiveRecord migrations to enable data migrations independently from schema migrations."
    s.description = "Utilizing ActiveRecord migrations to enable data migrations independently from schema migrations."

    s.rubyforge_project = "active_data_migrations"

    s.files = `git ls-files`.split("\n")
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]

    s.add_development_dependency "activerecord"
    s.add_development_dependency "rails"
    s.add_development_dependency "activerecord"
    s.add_development_dependency "sqlite3-ruby"
end
