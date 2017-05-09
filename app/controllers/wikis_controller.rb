class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    @public_wikis = @wikis.public_wikis(@wikis)
    @private_wikis = @wikis.visible_to(current_user)
    @user_wikis = @wikis.user_wikis(current_user)

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
    @wiki = Wiki.new
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
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

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
     params.require(:wiki).pemit(:user_id, :title, :body, :private)
   end

end
