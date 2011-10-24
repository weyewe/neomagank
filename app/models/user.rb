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
  
  has_many :portfolios
  
  after_create :create_profile
  
  after_create :send_notification_email
  
  
  def owns_profile( profile )
    profile.user_id == self.id 
  end
  
  def send_notification_email
    # Notifier.signup(@user).deliver
    
    Notifier.delay.welcome_email(@user)
    
    
    # Notifier.welcome_email(self.user, self).deliver
  end
  
  
  protected
  def create_profile
    Profile.create( :user_id => self.id )
  end
end
