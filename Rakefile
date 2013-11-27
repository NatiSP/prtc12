#!/usr/bin/env rake

$:.unshift File.dirname(__FILE__) + 'lib'

require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Ejecutar practica"
task :ejec do
 sh "ruby -Ilib /lib/prtc09/matrix.rb"
end

desc "Ejecucion de pruebas rspec"
task :spec do
  sh "rspec --color --format documentation -Ilib -Ispec spec/matrix_spec.rb"
end

desc "Ejecucion de test con formato html"
task :thtml do
  sh "rspec --format html -Ilib -Ispec spec/matrix_spec.rb"
end

desc "Ejecucion de las pruebas unitarias"
task :test do
  sh "ruby test/tc_matrix.rb"
end