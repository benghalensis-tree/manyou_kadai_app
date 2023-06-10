module TasksHelper

  def choose_tasks_index_or_users_show
    if action_name == 'new' || action_name == 'create'
      tasks_path

    else
      user_path(current_user.id)
    end
  end
end
