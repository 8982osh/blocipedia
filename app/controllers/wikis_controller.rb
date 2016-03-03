class WikisController < ApplicationController
  def index
  	@wikis = Wiki.all
  end

  def show
  	@wiki = Wiki.find(params[:id])
  end

  def new
  	@wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    @wiki.user = current_user
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
  end

  def update
  	@wiki = Wiki.find(params[:id])
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
end
