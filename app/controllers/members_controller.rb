class MembersController < ApplicationController

  before_action :find_member, only: [:edit, :update, :delete, :destroy]
  before_action :require_user, only: [:new, :show, :edit]
  before_action :require_admin, only: [:delete, :destroy]
  before_action :form_vars, only: [:new, :edit, :executives]

  def find_member
    @members = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  def show #for filtering entries
  end

  def new
    @members = Member.new
  end

  def create
    @members = Member.new(members_params) #the new Members entry is recreated through the strong params method
    @members.is_executive = true #Remove for members feature
    if @members.save #if the entry saves
      redirect_to({ action: 'executives' }, notice: @members.first_name + ' ' + @members.last_name + ' has been created!') #show all of the present entries
    else
      render({ action: 'new' }) #redisplay the create an entry page
    end
  end

  def edit
  end

  def update
    if @members.update_attributes(members_params)
      @members.is_executive = true #Remove for members feature
      redirect_to({ action: 'executives' }, notice: @members.first_name + ' ' + @members.last_name + ' has been updated!')
    else
      redirect_to({ action: 'new' }, alert: 'There was an error, fill out the form carefully and try again') #change for members
    end
  end

  def delete
  end

  def destroy
    @members.destroy
    redirect_to({ action: 'executives' }, alert: 'The member has been deleted!') #change for members

    respond_to do |format|
      format.js
    end
  end

  def executives
    @members = Member.where(is_executive: true).sort_by {|member| @executive.index(member.executive_position)}
  end

  private
    def members_params
      params.require(:member).permit(:first_name, :last_name, :linkedinurl, :major, :email, :graduation_date, :is_executive, :executive_position, :avatar)
    end
end
