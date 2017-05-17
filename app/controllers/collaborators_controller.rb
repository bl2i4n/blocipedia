class CollaboratorsController < ApplicationController

  before_action :get_wiki

  def index
    @users = User.all
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "Collaborator added."
    else
      flash[:alert] = "Error occured. Please try again."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed."
    else
      flash[:alert] = "Error occured. Please try again."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end

  private

  def get_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end


end
