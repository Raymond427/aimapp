class NewsController < ApplicationController
  def index
    @news = News.order('created_at DESC').all #sorts the news entries so that the latest feeds are on top
  end

  def show #This is form filtering entries, this method won't be needed for news entries
  end

  def new
    @news = News.new #creates new News entry
  end

  def create
    @news = News.new(news_params) #the new News entry is recreated through the strong params method
      if @news.save #if the entry saves
        redirect_to(:action => 'index') #show all of the present entries
        #flash[:notice] => "Your news entry was saved!"
      else
        render('new') #redisplay the create an entry page
        #flash[:notice] => "There was an error, fill out the form carefully and try again"
      end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
      if @news.update_attributes(news_params)
        redirect_to('index')
        #flash[:notice] => "News post was edited"
      else
        render('index')
      end
  end

  def delete
    @news = News.find(params[:id])
  end

  def destroy
    News.find(params[:id]).destroy
    redirect_to(:action => 'index')
    #flash[:notice] => "The news post was erased"
  end
  
  private
    def news_params
      params.require(:news).permit(:title, :date, :thumburl, :description)
    end
end
