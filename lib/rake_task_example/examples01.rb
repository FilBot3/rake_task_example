require 'rake'
require 'rake/tasklib'

# Continuting the examples.
module RakeTaskExample
  # RakeTaskExample::Example01
  class Example01 < ::Rake::TaskLib
    # Initialize the class.
    def initialize
      yield self if block_given?
      example_task
    end

    # example_task
    #
    # The example task for rake that could take and use extra arguments and
    # the Ruby DSL to customize it.
    def example_task
      desc 'Print Hello World from Rake::TaskLib'
      task :hello_world_tasklib do
        puts 'Hello World TaskLib'
      end
    end
  end
end
