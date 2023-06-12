# coding: utf-8

User.create(user_name: 'admin', admin: 1, email: "admin@amail.jp", password: "111111")

10.times do |i|
  user = User.create(user_name: "name#{i}", admin: 0, email: "test#{i}@gmail.jp", password: "111111")
end

10.times do |i|
  task = Task.create(task_name: "タスク#{i}", user: user.sample)
end

10.times do |i|
  label = Label.create(label_name: "ラベル#{i}")
end

20.tims do |i|
  LabelsTask.create(task_id: task.sample, label_id: label.sample)
end
