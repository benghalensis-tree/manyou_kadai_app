FactoryBot.define do
  
  factory :task do
    task_name { 'デフォルトのtask_name' }
    content { 'デフォルトのcontent' }
  end

  factory :task2 do
    task_name { 'デフォルトのtask_name2' }
    content { 'デフォルトのcontent2' }
  end

end