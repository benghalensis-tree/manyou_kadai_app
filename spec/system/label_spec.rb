require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task, user: @user)
    @label = FactoryBot.create(:label)
    FactoryBot.create(:labels_task, task: @task, label: @label)
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
        check 'テストラベル'
        click_on '登録する'
        expect(page).to have_content 'テストラベル'
        
      end
    end
  end
  describe '一覧画面' do
    context 'ラベルを検索した場合' do
      it 'そのラベルを持つタスクだけが表示される' do
        
      end
    end
  end
  describe '詳細画面' do
    context 'ラベルを付けたタスクの詳細画面に' do
      it 'すべてのラベルが表示されている' do
        
      end
    end
  end
end