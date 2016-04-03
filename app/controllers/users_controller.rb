class UsersController < ApplicationController

#allow user to change from Premium to Standard membership	
  def downgrade
    current_user.update_attribute(:role, 'standard')
      
    current_user.wikis.each do |wiki|
      wiki.update_attribue(:private, false)
    #wiki.private_wikis(current_user).update_attribute(private :false)
  end
    else
      #flash[:error] = "Invalid user information"
      redirect_to root_path
    end
  end 

  private

    def user_params
      params.require(:user).permit(:name, :role)
    end 

    def wiki_params(wiki)
      params.require(:wiki).permit(:private)
    end  
end


