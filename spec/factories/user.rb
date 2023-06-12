FactoryBot.define do

  factory :user do
    user_name { 'hoge' }
    email { 'test@gmail.com' }
    password { '111111' }
    password_confirmation { '111111' }
    admin { true }
  end
end
  