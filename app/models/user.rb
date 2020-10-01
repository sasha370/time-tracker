class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :trackable

  validates :last_name, :first_name, presence: true

  has_many :posts, dependent: :destroy

  def full_name
    last_name + ', ' + first_name
  end
end
