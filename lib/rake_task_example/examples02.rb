# Example Rake task that is more akin to a rakelib file with th extension
# of rake_lib.rake file. Its just more rake tasks just not in the rakefile.
# This also helps clean up the Rakefile as well.
desc 'Print Hello World with Rake files'
task :hello_world_rake do
  puts 'Hello World from Rake'
end
