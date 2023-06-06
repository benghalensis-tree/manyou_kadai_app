require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(task_name: '', content: '失敗テスト', status: '失敗テスト',priority: 2,end_date: 20230405, )
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(task_name: '失敗テスト', content: '', status: '失敗テスト',priority: 2,end_date: 20230405, )
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(task_name: '失敗テスト', content: '失敗テスト', status: '失敗テスト',priority: 2,end_date: 20230405, )
        expect(task).to be_valid
      end
    end
  end
end
