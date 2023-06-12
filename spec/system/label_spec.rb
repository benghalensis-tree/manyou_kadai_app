require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task,task_name: 'タスク1',  user: @user)
    @task2 = FactoryBot.create(:task, task_name: 'タスク2', user: @user)
    @label = FactoryBot.create(:label, label_name: 'ラベル1')
    @label2 = FactoryBot.create(:label, label_name: 'ラベル2')
    FactoryBot.create(:labels_task, task: @task, label: @label)
    FactoryBot.create(:labels_task, task: @task2, label: @label2)
    visit new_session_path
    fill_in 'メール', with: 'test@gmail.com'  
    fill_in 'パスワード', with: 111111
    click_on 'ログインする'
    sleep 0.5
    
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it 'ラベルが詳細画面に表示される' do
        visit new_task_path
        fill_in 'task_name', with: 'hogehoge'  
        fill_in 'content', with: 'hogehoge'  
        select '未着手', from: 'ステータス'
        select '高', from: '優先度'
        fill_in 'end_date', with: 20230610  
        check 'ラベル1'
        click_on '登録する'
        expect(page).to have_content 'ラベル1'
        
      end
    end
  end
  describe '一覧画面' do
    context 'ラベルを検索した場合' do
      it 'そのラベルを持つタスクだけが表示される' do
        visit tasks_path
        select 'ラベル1', from: 'search_label_id'
        click_on '検索'
        expect(page).not_to have_content 'タスク2'
      end
    end
  end
end