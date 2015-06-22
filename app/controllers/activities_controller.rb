class ActivitiesController < ApplicationController

  include ApplicationHelper

  before_action :logged_in

  before_action :activity_owner, only: [:show, :edit, :update, :destroy, :complete]

  before_action :set_user

  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  def index
    @activities = Activity.all
    @activity = Activity.new
    @user = User.find_by_id(session[:user_id])
  end

  def sort
    params[:order].each do |key,value|
      Activity.find(value[:id]).update_attribute(:priority, value[:position])
    end
    render :nothing => true
  end

  def complete
    activity = Activity.find(params[:id])
    activity.update(complete: true)
    @id = params[:id]
  end

  # GET /activities/1
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to root_path, notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      redirect_to root_path, notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
    redirect_to root_path, notice: 'Activity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def set_user
      @user = User.find(session[:user_id]) rescue nil
    end

    # Only allow a trusted parameter "white list" through.
    def activity_params
      params.require(:activity).permit(:user_id, :category_id, :name, :due_date, :description, :priority, :order)
    end
end
