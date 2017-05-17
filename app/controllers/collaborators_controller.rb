class CollaboratorsController < ApplicationController

  before_action :get_wiki

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "Collaborator added."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "Error occured. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "Error occured. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  private

  def get_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end


end
