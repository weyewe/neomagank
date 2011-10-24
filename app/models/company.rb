class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :jobs
  has_one :company_profile
  after_create :create_company_profile
  
  
  protected
  def create_profile
    Profile.create( :company_id => self.id )
  end
  
  
end
