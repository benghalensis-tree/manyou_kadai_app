FactoryBot.define do

  factory :user do
    user_name { 'デフォルトのuser_name' }
    email { 'デフォルトのemail' }
    password { 111111 }
    password_confirmation { 111111 }
    admin { true }
  end
  
  factory :second_user do
    user_name { 'デフォルトのuser_name2' }
    email { 'デフォルトのemail2' }
    password { 222222 }
    password_confirmation { 222222 }
    admin { false }
  end
end