class MembersController < ApplicationController
  def index
    @members = Members.all
  end

  def show #for filtering entries
  end

  def new
    @members = Members.new
  end

  def create
    @members = Members.new(members_params) #the new News entry is recreated through the strong params method
      if @members.save #if the entry saves
        redirect_to(:action => 'index') #show all of the present entries
        #flash[:notice] => "Your news entry was saved!"
      else
        render('new') #redisplay the create an entry page
        #flash[:notice] => "There was an error, fill out the form carefully and try again"
      end
  end

  def edit
    @members = Members.find(params[:id])
  end

  def update
    @members = Members.find(params[:id])
      if @members.update_attributes(news_params)
        redirect_to('index')
        #flash[:notice] => "News post was edited"
      else
        render('index')
      end
  end

  def delete
    @members = Members.find(params[:id])
  end
  
  def destroy
    News.find(params[:id]).destroy
    redirect_to(:action => 'index')
    #flash[:notice] => "The news post was erased"
  end

  private
    def news_params
      params.require(:members).permit(:first_name, :last_name, :major, :graduation_date, :is_executive, :executive_position)
    end
end
