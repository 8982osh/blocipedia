class WikisController < ApplicationController

  #before_action :authenticate_user!
  def index
  	@wikis = Wiki.all
    authorize @wikis
  end

  def show
  	@wiki = Wiki.find(params[:id])
  end

  def new
  	@wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    @wiki.user = current_user
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
    authorize @wiki
  end

  def update
  	@wiki = Wiki.find(params[:id])
    authorize @wiki
  	if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
  	  flash[:notice] = "Wiki was updated."
  	  redirect_to @wiki
  	else
      flash[:notice] = "Error updating the wiki. Please try again."
      render :edit
    end
  end

  def destroy
  	@wiki = Wiki.find(params[:id])
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
end
