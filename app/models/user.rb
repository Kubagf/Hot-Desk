class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservation

  validates :role, presence: true

  def admin?
    self.role == 'admin'
  end
  def user?
    self.role == 'user'
  end
end
