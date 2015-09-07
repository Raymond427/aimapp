class NewsController < ApplicationController

  before_action :require_editor, only: [:new, :show, :edit]
  before_action :require_admin, only: [:delete, :destroy]
  before_action :find_news, only: [:edit, :update, :delete, :destroy]

  def find_news
    @news = News.find(params[:id])
  end

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
        redirect_to({ action: 'index' }, notice: @news.title + ' has been created!') #show all of the present entries
      else
        redirect_to({ action: 'new' }, alert: 'There was an error, fill out the form carefully and try again')
      end
  end

  def edit
  end

  def update
      if @news.update_attributes(news_params)
        redirect_to({ action: 'index' }, notice: @news.title + ' has been updated!')
      else
        render(:action => 'index')
      end
  end

  def delete
  end

  def destroy
    @news.destroy
    redirect_to({ action: 'index' }, alert: 'The news post has been deleted!')
  end
  
  private
    def news_params
      params.require(:news).permit(:title, :date, :mediatype, :thumburl, :description)
    end
end
