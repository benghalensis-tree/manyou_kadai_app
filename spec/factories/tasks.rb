FactoryBot.define do

  factory :task do
    task_name { 'デフォルトのtask_name' }
    content { 'デフォルトのcontent' }
    status { 'デフォルトのstatus' }
    priority { 3 }
    end_date { 20230608 }
  end

  factory :task2 do
    task_name { 'デフォルトのtask_name2' }
    content { 'デフォルトのcontent2' }
  end

end