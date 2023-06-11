class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! if email.present?}
  has_secure_password
  validates :password, length: { minimum: 6}
  has_many :tasks, dependent: :destroy
  before_update :always_one_admin


  private
  def always_one_admin
    if User.pluck(:admin).count(true) <= 1 && admin_was && admin == false
      throw(:abort)
    end
  end
end
