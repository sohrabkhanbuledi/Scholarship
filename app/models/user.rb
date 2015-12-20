class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :username, :email, :password, :password_confirmation, :avatar, :remember_me

  acts_as_commontator

  has_attached_file :avatar, :styles => { :medium => "350x350>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :username,
  presence: true,
  format: {
  with: /\A[a-z A-Z]+\Z/
  }
  
  has_many :articles, dependent: :destroy
  has_many :commontators, dependent: :destroy

end
