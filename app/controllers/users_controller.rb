class UsersController < ApplicationController

#allow user to change from Premium to Standard membership	
  def downgrade
    current_user.update_attribute(:role, 'standard')
    
    current_user.wikis.each do |wiki|
    Wiki.private_wikis(current_user).update_attribute(private :false)

  end
end


