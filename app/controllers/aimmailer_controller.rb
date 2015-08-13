class AimMailersController < ApplicationController
  before_action :find_mail, only: [:edit, :update, :delete]
  before_action :form_vars, only: [:new, :edit]

  def find_mail
    @mail = AimMailers.find(params[:id])
  end

  def index
    @mail = AimMailers.all
  end

  def form_vars
    @majors = ['Computer Science', 'Mechanical Engineering']
  end

  def new
    @mail = AimMailers.new
  end

  def create
    @mail = AimMailers.new(mail_params)
    if @mail.save
      @mail
      redirect_to(:controller => 'pages', :action => 'root')
    else
      render(:action => 'new')
    end
  end

  def destroy
  end

  def delete
    @mail.destroy
    redirect_to(:controller => 'pages', :action => 'root')
  end
end
