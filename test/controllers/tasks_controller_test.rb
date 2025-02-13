require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  setup do
    @user = users(:user_one) # Ensure there is a test user fixture
    sign_in @user       # Sign in the user before each test
    @task = tasks(:one) # Ensure there is a test task fixture
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { completed: @task.completed, description: @task.description, due_date: @task.due_date, title: @task.title, user_id: @task.user_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { completed: @task.completed, description: @task.description, due_date: @task.due_date, title: @task.title, user_id: @task.user_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
