# model名 User
- user_name : string
- email : string
- password_digest :string

# model名 Task
- task_name : string
- content : text
- status : string
- priority : integer
- end_date : date
- user_id : foreign_key

# model名 Label
- label_name : string

# model名 LabelsTask
- label_id : foreign_key
- task_id : foreign_key

# herokuへのデプロイ手順
1.heroku createをターミナルで実行

2.Gemfileに
gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
を追加しbundle install
その後addとcommitする

3.bundle lock --add-platform x86_64-linuxをターミナルで実行

4.heroku stack:set heroku-20を実行

5.packege.jsonにenginesを記述

6.git push heroku step2:masterを実行


