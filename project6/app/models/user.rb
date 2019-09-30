class User < ApplicationRecord
  has_many :memberships
  has_many :ratings
  has_many :groups, :through => :memberships
  has_many :courses
  has_many :evaluates

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
