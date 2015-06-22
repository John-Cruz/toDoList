class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  def index
    @activities = Activity.all
    @activity = Activity.new
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
    @activity = Activity.create!(name: params[:activity][:name], 
        due_date: params[:activity][:due_date], description: params[:activity][:description],
        priority: params[:activity][:priority], category_id: params[:activity][:category_id])
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
    redirect_to activities_url, notice: 'Activity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_params
      params.require(:activity).permit(:category_id, :name, :due_date, :description, :priority, :order)
    end
end
