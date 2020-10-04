class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :last_name, :first_name, :phone, presence: true

  has_many :posts, dependent: :destroy

  PHONE_REGEX = /\A[0-9]*\z/
  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: {is: 10}


  def full_name
    last_name + ', ' + first_name
  end


end
