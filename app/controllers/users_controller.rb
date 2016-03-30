class UsersController < ApplicationController

#allow user to change from Premium to Standard membership	
  def downgrade
  	current_user.update_attribute(:role, 'standard')
  end
end
