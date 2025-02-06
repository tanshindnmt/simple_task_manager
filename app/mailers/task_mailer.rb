class TaskMailer < ApplicationMailer
  default from: "no-reply@thebenders.ninja"

  def reminder_email(task)
    @task = task
    mail(to: @task.user.email, subject: "Reminder: Your task '#{@task.title}' is due soon!")
  end
end
