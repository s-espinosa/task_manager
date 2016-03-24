require_relative '../test_helper'

class UserSeesGreetingOnHomepage < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_is_welcomed
    visit "/"

    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end
end
