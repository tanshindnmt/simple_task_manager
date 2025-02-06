class TaskReminderJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find_by(id: task_id)
    # Only send a reminder if the task exists, is not completed, and its due date is still in the future.
    if task && !task.completed? && task.due_date > Time.current
      TaskMailer.reminder_email(task).deliver_now
    end
  end
end
