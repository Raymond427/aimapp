class GuestsController < ApplicationController
  
  before_action :require_editor, only: [:show, :edit, :index]
  before_action :require_admin, only: [:delete, :destroy]
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :form_vars, only: [:new, :edit]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  def form_vars
    @majors = ['Accounting', 'Africana Studies', 'Anthropology', 'Architecture', 'Art', 'Art History', 'Athletic Training', 'Biology', 'Business Administration', 'Chemistry', 'Child and Family Development', 'Civil Engineering', 'Civil Engineering Technology', 'Computer Science', 'Computer Engineering', 'Construction Management', 'Criminal Justice', 'Dance', 'Earth and Environmental Sciences', 'Economics', 'Electrical Engineering', 'Electrical Engineering Technology', 'Elementary Education', 'English', 'Environmental Studies', 'Exercise Science', 'Finance', 'Fire Safety Engineering Technology', 'French', 'Geography', 'Geology', 'German', 'History', 'International Business', 'International Studies', 'Japanese', 'Latin American Studies', 'Management', 'Management Information Systems', 'Marketing', 'Mathematics', 'Mathematics for Business', 'Mechanical Engineering', 'Mechanical Engineering Technology', 'Meteorology', 'Middle Grades Education', 'Music', 'Neurodiagnostics and Sleep Science', 'Nursing', 'Ops & Supply Chain Management', 'Pre-Law', 'Philosophy', 'Physics', 'Political Science', 'Psychology', 'Public Health', 'Religious Studies', 'Respiratory Therapy', 'Social Work', 'Sociology', 'Spanish', 'Special Education', 'Systems Engineering', 'Theatre']
    @grad_month = ['May', 'December']
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        #Send the new_member_email after saving
        #if @guest.type == 'corporate'
          #GuestMailer.corporate_email(@guest).deliver_later
        #elsif @guest.type == 'member'
          #GuestMailer.new_member_email(@guest).deliver_later
        #end
        format.html { redirect_to '/', notice: 'We got your message! You will hear from us soon!' }
      else
        format.html { render :new, alert: 'There was an error, fill out the form carefully and try again' }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :email, :phone_number, :company, :subject, :message, :major, :grad_season, :grad_year, :type)
    end
end
