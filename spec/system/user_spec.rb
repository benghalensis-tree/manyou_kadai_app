require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  describe '新規登録機能' do
    context 'タスクを新規作成した場合' do
      it '作成したユーザーが表示される' do
        visit new_user_path
        fill_in '名前', with: 'hogehoge'  
        fill_in 'メールアドレス', with: 'test@gmail.com'  
        fill_in 'パスワード', with: 123456 
        fill_in '確認用パスワード', with: 123456 
        click_on '新規作成'
        expect(page).to have_content 'hogehoge'
      end
    end
    context '未ログイン者が一覧画面にアクセスした場合' do
      it 'ログイン画面に遷移する' do
        visit tasks_path
        expect(page).to have_content 'Log in'
      end
    end 
  end

  describe 'セッション機能' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:user, user_name: 'fuga', email:'test2@gmail.com', admin: false )
    end
    context 'ログインした場合' do
      it 'フラッシュメッセージが表示される' do
        visit new_session_path
        fill_in 'メール', with: 'test@gmail.com'  
        fill_in 'パスワード', with: 111111
        click_on 'ログインする'
        expect(page).to have_css('.test', text: 'ログインに成功しました')
        
      end
    end
    context '一般ユーザが他人の詳細画面に飛ぶと' do
      it 'タスク一覧画面に遷移する' do

        
      end
    end
  end

  describe '管理画面機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        
       end
     end
  end
end