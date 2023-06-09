FactoryBot.define do

  factory :task do
    task_name { 'デフォルトのtask_name' }
    content { 'デフォルトのcontent' }
    status { '未着手' }
    priority { 3 }
    end_date { 20230608 }
  end

  factory :second_task do
    task_name { 'デフォルトのtask_name2' }
    content { 'デフォルトのcontent2' }
    status { '未着手' }
    priority { 3 }
    end_date { 20230608 }
  end

end