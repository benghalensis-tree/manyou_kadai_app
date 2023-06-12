module TasksHelper

  def choose_tasks_index_or_users_show
    if action_name == 'index'
      tasks_path

    else
      user_path(current_user.id)
    end
  end
end
