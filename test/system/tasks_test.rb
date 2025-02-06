require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)  # Ensure there is a test user
    sign_in @user
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit tasks_url

    click_on "New task", match: :first

    check "Completed" if @task.completed
    fill_in "Description", with: @task.description
    fill_in "Due date", with: @task.due_date
    fill_in "Title", with: @task.title
    fill_in "User", with: @task.user_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit task_url(@task)
    click_on "Edit this task", match: :first

    check "Completed" if @task.completed
    fill_in "Description", with: @task.description
    fill_in "Due date", with: @task.due_date.to_s
    fill_in "Title", with: @task.title
    fill_in "User", with: @task.user_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit task_url(@task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end
