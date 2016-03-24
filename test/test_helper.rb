ENV['RACK_ENV'] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = TaskManagerApp

module TestHelpers
  def teardown
    task_manager.destroy_all
    super
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end

  def create_tasks(num = 2)
    num.times do |current_num|
      task_manager.create({
        :title => "Task #{current_num + 1}",
        :description => "Description #{current_num + 1}"
      })
    end
  end

  def task_input
    {:title       => "New Task",
     :description => "New Task Description"}
  end
end
