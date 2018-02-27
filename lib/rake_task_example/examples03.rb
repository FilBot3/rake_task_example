#
# Documentation:
#   https://lostechies.com/derickbailey/2009/09/17/how-a-net-developer-hacked-out-a-rake-task/
#   https://lostechies.com/derickbailey/2009/09/18/an-alternate-way-to-handle-task-dependencies-in-custom-rake-tasks/

require 'rake'
require 'rake/tasklib'

module Phil
  class FooTask < Rake::TaskLib
    # Setting the name of the task to be used.
    attr_accessor :name

    # Setting an OPTIONAL attribute. This will simply display what is given to
    # the attr_accessor. Typically a string.
    attr_accessor :data

    # Used to hold the task dependencies. This is technically an array.
    attr_accessor :task_dependencies

    # Initialize is what we use to call our block and then subsequent methods.
    #
    # @param [Symbol] name, Defaults to :task
    # @param [Array<Symbols>] task_dependencies, Empty Array
    def initialize(name = :task, task_dependencies = [])
      @name = name
      @data = nil
      # Yield to allow our block to be evaluated.
      yield self if block_given?
      @task_dependencies = task_dependencies
      # Call our define method which should name the given task the name of the
      # symbol passed to our initialize method.
      define
    end

    def define
      # Since we required rake and rake/tasklib, this allows us to use the Rake
      # DSL methods to define our functions.
      desc "Run the #{@name} task"
      task @name => @task_dependencies do
        puts 'Some Test being Printed'
        puts @data
        # We can even shell out to system calls with the sh function.
        sh 'echo blah'
      end
      self
    end
  end
end

# Call our Custom Rake task with dependencies not specifying a block.
Phil::FooTask.new( :foo, [:call_me_first, :call_me_second] )

namespace :fake do
  # Call our custom Rake task with dependencies again, without the ()
  Phil::FooTask.new :bar, [:call_me_first, :call_me_second]
end

# Without a desc comment, these commands are not visible. Handy for "hidden"
# Rake tasks that are used as dependencies.
task :call_me_first do
  puts 'I am called first because I am a dependency'
end

task :call_me_second do
  puts 'I am called second because I\'m also a dependency'
end

# This Rake task doesn't have a desc, but still displays it because in the
# custom task, it lists it for us. Defining one out of the custom task doesn't
# change it.
Phil::FooTask.new :stuff do |t|
  t.data = 'I am a stuff task.'
end
