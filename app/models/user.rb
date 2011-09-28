class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_one :profile
  has_many :work_experiences
  has_many :skills
  has_many :educations
  
  after_create :create_profile
  
  
  
  
  
  protected
  def create_profile
    Profile.create( :user_id => self.id )
  end
end
