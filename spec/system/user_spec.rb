require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_name', with: 'hogehoge'  
        fill_in 'content', with: 'hogehoge'  
        select '未着手', from: 'ステータス'
        select '高', from: '優先度'
        fill_in 'end_date', with: 20230610  
        click_on '登録する'
        expect(page).to have_content 'hogehoge'
      end
    end
  end
  describe '一覧表示機能' do
    before do
      task = FactoryBot.create(:task, status:'未着手', id:2, task_name: 'hoge', priority: '中', end_date: 20230607)
      task2 = FactoryBot.create(:task,status:'未着手', id:3, task_name: 'fuga', priority: '高', end_date: 20230604)
      task3 = FactoryBot.create(:task, status:'未着手',id:1, task_name: 'hogefuga', priority: '低', end_date: 20230606)
      visit tasks_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'hoge'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'fuga'
      end
    end
    context 'ソートボタンを押した場合' do
      it '期日が近いものが一番上に表示される' do
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'fuga'
      end
    end
    context '優先度ボタンを押した場合' do
      it '優先度の高いものが上に表示される' do
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'fuga'
      end
    end
    context '検索をした場合' do
      it 'タイトルで検索できる' do
        fill_in 'タスク名', with: 'hogehoge'  
        click_on '検索'
        task_list = all('.task_row')
        expect(task_list).not_to have_content 'fuga'
      end
      it 'ステータスで検索できる' do
        select '未着手', from: 'ステータス'
        click_on '検索'
        task_list = all('.task_row')
        expect(task_list).not_to have_content '完了'
      end
      it 'タイトルとステータス両方で検索できる' do
        fill_in 'タスク名', with: 'hogehoge'  
        select '未着手', from: 'ステータス'
        click_on '検索'
        task_list = all('.task_row')
        expect(task_list).not_to have_content 'fuga'
        expect(task_list).not_to have_content '完了'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        content = FactoryBot.create(:task, content: 'hogehoge')
        visit task_path(content)
        expect(page).to have_content 'hogehoge'
       end
     end
  end
end