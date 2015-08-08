class MembersController < ApplicationController

  before_action :find_member, only: [:edit, :update, :delete]
  before_action :require_editor, only: [:new, :show, :edit]
  before_action :require_admin, only: [:delete, :destroy]
  before_action :form_vars, only: [:new, :edit]

  def find_member
    @members = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  def show #for filtering entries
  end

  def form_vars
    @majors = ['Computer Science', 'Mechanical Engineering']
    @executive = [[1, 'President'], [2, 'Vice President'], [3, 'Treasurer'], [4, 'Director of Programs'], [5, 'Director of Strategic Partnerships'], [6, 'Director of Public Relations'], [7, 'Director of Publications'], [8, 'Director of Community Service'], [9, 'Director of Fundraising'], [10, 'Historian'], [11, 'Digital Administrator']]
    @grad_year = [[1, 'Fall 2016'], [2, 'Spring 2016']]
  end

  def new
    @members = Member.new
  end

  def create
    @members = Member.new(members_params) #the new Members entry is recreated through the strong params method
    @members.is_executive = true #Remove for members feature
      if @members.save #if the entry saves
        redirect_to(:action => 'executives', notice: '#{@member.first_name} #{@member.last_name} has been created') #show all of the present entries
        #flash[:notice] => 'Your news entry was saved!'
      else
        render(:action => 'new') #redisplay the create an entry page
        #flash[:notice] => 'There was an error, fill out the form carefully and try again'
      end
  end

  def edit 
  end

  def update
      if @members.update_attributes(members_params)
        @members.is_executive = true #Remove for members feature
        redirect_to(:action => 'executives', notice: '#{@member.first_name} #{@member.last_name} has been updated') #change for members
        #flash[:notice] => 'News post was edited'
      else
        redirect_to(:action => 'executives') #change for members
      end
  end

  def delete
  end
  
  def destroy
    Member.find(params[:id]).destroy
    redirect_to(:action => 'executives', notice: '#{@member.first_name} #{@member.last_name} has been destroyed') #change for members
    #flash[:notice] => 'The news post was erased'
  end

  def executives
    @members = Member.where(is_executive: true)
    #@executive_semester = [['Fall 2016', 1], ['Spring 2016', 2]]
  end

  private
    def members_params
      params.require(:member).permit(:first_name, :last_name, :thumb_url, :linkedin_url, :major, :email, :graduation_date, :is_executive, :executive_position)
    end
end
