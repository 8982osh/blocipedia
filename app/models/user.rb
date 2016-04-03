class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :wikis
  #has_many :collaborators

  
  #after_initialize :set_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable   

  def admin?
  	role == 'admin'
  end  

  def moderator?
    role == 'premium'
  end

  def standard?
    self.role == 'standard'
  end

  
end



