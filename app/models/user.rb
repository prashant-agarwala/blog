class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :posts


  accepts_nested_attributes_for :profile

  after_create :create_default_profile

  private
  def create_default_profile
    self.create_profile(email: self.email)
  end
end
