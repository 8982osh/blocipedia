class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :wikis
  
  #validates :role
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

  #def upgrade?
  #  if @user.update_with_payment
  #    @user.update_attribute(:premium, true)
  #  redirect_to about_path
  #  else
  #  render :new
  #  end
  #end

 #offer user to downgrade to standard
  #def downgrade
    #if self.premium?
  #  current_user.update_attributes(role: 'standard')
    #role == 'standard'
  #  redirect_to edit_user_registration_path
    #end
  #end
end



