require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    create_tasks(1)

    task = task_manager.find(1)

    assert_equal "Task 1", task.title
    assert_equal "Description 1", task.description
    assert_equal 1, task.id
  end

  def test_it_returns_all_tasks
    create_tasks(3)

    tasks = task_manager.all

    assert_equal 3, tasks.count
    assert_equal 1, tasks[0].id
    assert_kind_of Task, tasks[0]
  end

  def test_it_finds_a_task_by_number
    create_tasks(4)
    task = task_manager.find(2)

    assert_kind_of Task, task
    assert_equal 2, task.id
    assert_equal "Task 2", task.title
  end

  def test_it_can_update_a_task
    create_tasks(4)
    task = task_manager.find(4)

    assert_equal 4, task.id
    assert_equal "Task 4", task.title

    task_manager.update(4, task_input)

    task = task_manager.find(4)
    assert_equal 4, task.id
    assert_equal "New Task", task.title
  end

  def test_it_can_destroy_a_task
    create_tasks(5)
    task = task_manager.find(4)

    assert_equal 4, task.id
    assert_equal "Task 4", task.title

    task_manager.destroy(4)

    tasks = task_manager.all

    assert_equal 4, tasks.count
    assert_equal 5, tasks[3].id
  end
end
