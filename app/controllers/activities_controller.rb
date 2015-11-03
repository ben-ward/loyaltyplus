class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @activities = current_user.activities.order('created_at DESC')
    respond_with(@activities)
  end

  def new
    @activity = current_user.activities.new
    respond_with(@activity)
  end

  def create
    @activity = current_user.activities.new(activity_params)
    @activity.points = @activity.amount.try(:floor)
    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  def redeem
    if current_user.balance >= 100
      @activity = current_user.activities.create(points: -100, amount: 0)
      flash[:notice] = "Gift Card created."
      redirect_to activities_path
    else
      flash[:notice] = "Balance too low"
      redirect_to activities_path
    end
  end

  def destroy
    @activity.destroy
    respond_with(@activity)
  end

  private
    def set_activity
      @activity = current_user.activities.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:user_id, :amount, :points)
    end
end
