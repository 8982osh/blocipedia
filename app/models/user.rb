class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :wikis
  after_initialize :standard?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable   

  def admin?
  	role == 'admin'
  end  

  def moderator?
    role == 'premium'
  end

  def standard?
    role == 'standard'
  end 

end



