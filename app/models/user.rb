class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email,:Telephone,:image, :City,:Address,:Birthday,:Country,:Gender, :password, :password_confirmation, :remember_me
  has_many :trips
  has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }

  has_many :posts
  has_many :topics

  has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }
  accepts_nested_attributes_for :trips, :allow_destroy => :true,
  :reject_if => proc { |attrs| attrs.all? { |_, v| v.blank? } }
end
