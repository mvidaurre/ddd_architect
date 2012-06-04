# encoding: UTF-8
require 'rake'
require 'rake/testtask'
require 'rdoc/task'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ddd_architect'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "ddd_architect"
    s.version = "0.8.1"
    s.summary = "Creates a Rails 3 engine with Rakefile, Gemfile and running tests"
    s.email = "jose.valim@plataformatec.com.br"
    s.homepage = "http://github.com/josevalim/ddd_architect"
    s.description = "Creates a Rails 3 engine with Rakefile, Gemfile and running tests"
    s.authors = ['José Valim']
    s.files =  FileList["[A-Z]*", "lib/**/*"]
    s.bindir = "bin"
    s.executables = %w(ddd_architect)
    s.add_dependency("thor", "~> 0.14")
    s.add_dependency("rails", "~> 3.0.3")
    s.add_dependency("rake", "~> 0.8")
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler"
end
