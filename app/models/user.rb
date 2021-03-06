class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :last_name, :first_name, :phone, :ssn, :company, presence: true

  has_many :posts, dependent: :destroy
  has_many :audit_logs, dependent: :destroy
  has_many :hands

  PHONE_REGEX = /\A\d{1,14}$\z/
  validates_format_of :phone, with: PHONE_REGEX
  validates :ssn, length: { is: 4 }
  validates_numericality_of :ssn


  def full_name
    last_name + ', ' + first_name
  end


end
