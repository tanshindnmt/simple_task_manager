class Task < ApplicationRecord
  belongs_to :user

  # After creating a task, schedule a reminder job 1 hour before the due date (if due_date is set and in the future)
  after_create :schedule_reminder, if: -> { due_date.present? && due_date > Time.current }

  private

  def schedule_reminder
    # Schedule the reminder job to run at (due_date - 1 hour)
    TaskReminderJob.set(wait_until: due_date - 1.hour).perform_later(id)
  end
end
