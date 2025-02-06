# Simple Task Manager

A simple Ruby on Rails application that lets users manage tasks. Features include:

- User authentication (using Devise)
- CRUD operations for tasks (each task has a title, description, due date, and completion status)
- Background job (using Sidekiq) that sends an email reminder 1 hour before a task’s due date

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone git@github.com:yourusername/simple_task_manager.git
   cd simple_task_manager
