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
  end
  describe '一般ユーザ機能' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:user, user_name: 'fuga', email:'test2@gmail.com', admin: false )
      visit new_session_path
      fill_in 'メール', with: 'test2@gmail.com'  
      fill_in 'パスワード', with: 111111
      click_on 'ログインする'
      sleep 0.5
    end
    context '一般ユーザが他人の詳細画面に飛ぶと' do
      it 'フラッシュメッセージが表示される' do
        visit user_path(@user.id)
        expect(page).to have_css('.test', text: '不正なアクセスです')
      end
    end
    context '一般ユーザが管理画面にアクセスしたら' do
      it 'フラッシュメッセージが表示される' do
        visit admin_users_path
        expect(page).to have_css('.test', text: '管理者権限がありません')
      end
    end
    context 'ログアウトすると' do
      it 'フラッシュメッセージが表示される' do
        click_on 'ログアウト'
        expect(page).to have_css('.test', text: 'ログアウトしました')
      end
    end
  end
  
  describe '管理画面機能' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:user, user_name: 'fuga', email:'test2@gmail.com', admin: false )
      visit new_session_path
      fill_in 'メール', with: 'test@gmail.com'  
      fill_in 'パスワード', with: 111111
      click_on 'ログインする'
      sleep 0.5
    end
    context '管理ユーザが管理画面にアクセスしたら' do
      it 'フラッシュメッセージが表示されない' do
        visit admin_users_path
        expect(page).not_to have_content '管理者権限がありません'
      end
    end
    
    context '管理ユーザがユーザの新規登録をすると' do
      it 'emailが一覧画面に表示される' do
        visit new_admin_user_path
        fill_in '名前', with: 'hogehoge'  
        fill_in 'メールアドレス', with: 'test3@gmail.com'  
        fill_in 'パスワード', with: 123456 
        fill_in '確認用パスワード', with: 123456 
        click_on '新規作成'
        expect(page).to have_content 'test3@gmail.com'
      end
    end
    context '管理ユーザが詳細画面にアクセスしたら' do
      it 'フラッシュメッセージが表示されない' do
        visit admin_user_path(@second_user.id)
        expect(page).not_to have_content '管理者権限がありません'
      end
    end
  end
end