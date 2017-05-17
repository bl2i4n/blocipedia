class WikisController < ApplicationController
  def index
    @policy_wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @user = current_user
    @wiki = Wiki.new
  end

  def create
    @user = current_user
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
        flash[:notice] = "Wiki was saved."
        redirect_to @wiki
    else
      flash.now[:alert]= "There was an error saving the wiki. Please try again."
      render :new
    end
  end


  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    @get_wikis = Collaborator.where(wiki_id: @wiki.id)
    @collaborators = User.where(id: @get_wikis.pluck(:user_id))
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was error saving wiki. Please try again."
      render :edit
    end
  end

  def destroy
     @wiki = Wiki.find(params[:id])

     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

   private

   def wiki_params
     params.require(:wiki).permit(:user_id, :title, :body, :private)
   end

   def find_wiki_author()
   end

end
