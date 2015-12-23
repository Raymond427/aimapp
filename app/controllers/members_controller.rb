class MembersController < ApplicationController

  before_action :find_member, only: [:edit, :update, :delete, :destroy]
  before_action :require_editor, only: [:new, :show, :edit]
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

  def form_vars
    @majors = ['Accounting', 'Africana Studies', 'Anthropology', 'Architecture', 'Art', 'Art History', 'Athletic Training', 'Biology', 'Business Administration', 'Chemistry', 'Child and Family Development', 'Civil Engineering', 'Civil Engineering Technology', 'Computer Science', 'Computer Engineering', 'Construction Management', 'Criminal Justice', 'Dance', 'Earth and Environmental Sciences', 'Economics', 'Electrical Engineering', 'Electrical Engineering Technology', 'Elementary Education', 'English', 'Environmental Studies', 'Exercise Science', 'Finance', 'Fire Safety Engineering Technology', 'French', 'Geography', 'Geology', 'German', 'History', 'International Business', 'International Studies', 'Japanese', 'Latin American Studies', 'Management', 'Management Information Systems', 'Marketing', 'Mathematics', 'Mathematics for Business', 'Mechanical Engineering', 'Mechanical Engineering Technology', 'Meteorology', 'Middle Grades Education', 'Music', 'Neurodiagnostics and Sleep Science', 'Nursing', 'Ops & Supply Chain Management', 'Pre-Law', 'Philosophy', 'Physics', 'Political Science', 'Psychology', 'Public Health', 'Religious Studies', 'Respiratory Therapy', 'Social Work', 'Sociology', 'Spanish', 'Special Education', 'Systems Engineering', 'Theatre']
    @executive = ['President', 'Vice President', 'Treasurer', 'Secretary', 'Director of Strategic Partnerships', 'Director of Programs', 'Director of Public Relations', 'Director of Publications', 'Director of Community Service', 'Director of Fundraising', 'Historian', 'Digital Administrator', 'Strategic Advisor']
    @grad_month = ['Fall', 'Summer', 'Spring']
    @grad_year = ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025']
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
      redirect_to({ action: 'new' }, notice: 'There was an error, fill out the form carefully and try again') #redisplay the create an entry page
    end
  end

  def edit 
  end

  def update
    if @members.update_attributes(members_params)
      @members.is_executive = true #Remove for members feature
      redirect_to({ action: 'executives' }, notice: @members.first_name + ' ' + @members.last_name + ' has been updated!')
    else
      redirect_to({ action: 'new' }, alert: 'There was an issue, fill out the form carefully and try again') #change for members
    end
  end

  def delete
  end
  
  def destroy
    @members.destroy
    redirect_to({ action: 'executives' }, alert: 'The member has been deleted!') #change for members
  end

  def executives
    @members = Member.where(is_executive: true).sort_by { |member| @executive.index(member.executive_position) }
  end

  private
    def members_params
      params.require(:member).permit(:first_name, :last_name, :thumburl, :linkedinurl, :major, :email, :graduation_date, :is_executive, :executive_position)
    end
end
