class WikisController < ApplicationController

  
  def index
  	@wikis = policy_scope(Wiki)
    #@wikis = Wiki.visible_to(current_user).where("wikis.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
    #authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    #@wikis = @wikis.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
    authorize @wiki
    
  end

  def new
  	@wiki = Wiki.new
    #@users = User.all
    #authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    #@wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    #@user = @wiki.user
    authorize @wiki
    if @wiki.save
    	flash[:notice] = "Wiki was saved."
    	redirect_to @wiki
    else
    	flash[:error] = "Error when saving. Plese try again."
    	render :new
    end
  end

  def edit
  	@wiki = Wiki.find(params[:id])
    @users = User.all
    authorize @wiki
  end

  def update
  	@wiki = Wiki.find(params[:id])
    authorize @wiki
  	if @wiki.update_attributes(wiki_params)
  	  flash[:notice] = "Wiki was updated."
  	  redirect_to @wiki
  	else
      flash[:notice] = "Error updating the wiki. Please try again."
      render :edit
    end
  end

  def destroy
  	@wiki = Wiki.find(params[:id])
    #authorize @wiki
  	if @wiki.destroy
  	  flash[:notice] = "Wiki was deleted."
  	  redirect_to wiki_path
  	else
  	  flash[:error] = "Error when deleting wiki. Try again."
  	  render :show
    end
  end

  def downgrade
    current_user.downgrade
    flash[:notice] = "You're account is now at Standard"
    redirect_to index_path
  end


  private 

  def wiki_params
    params.require(:wiki).permit(:title, :body, :publc)
  end
end
