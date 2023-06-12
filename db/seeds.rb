# coding: utf-8

User.create(user_name: 'admin', admin: 1, email: "admin@gmail.com", password: "111111")

10.times do |i|
 User.create(user_name: "name#{i}", admin: 0, email: "test#{i}@gmail.jp", password: "111111")
end

user = User.all
30.times do |i|
  task = Task.create(task_name: "タスク#{i}",content: 'デフォルト', status: '未着手', priority: 3, end_date: 20200101, user_id: rand(10) )
end

10.times do |i|
  label = Label.create(label_name: "ラベル#{i}")
end

task = Task.all
label = Label.all
40.times do |i|
  LabelsTask.create(task_id: rand(30), label_id: rand(10))
end
