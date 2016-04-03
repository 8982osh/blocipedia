class CollaboratorsController < ApplicationController

  before_action :set_wiki

  def new
  end

  def create
  	@collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
  	if @collaborator.save
  	  flash[:notice] = "Wiki was saved."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "Error when saving. Plese try again."
      render :new
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "Error when saving. Please try again."
      #redirect, notice: @collaborator.errors.full_messages
      render :new
    end
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
