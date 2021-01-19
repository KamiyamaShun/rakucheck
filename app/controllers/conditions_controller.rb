class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to root_path
    else
      render :new
    end

    private
    
    def condition_params 
      params.require(:condition).permit(:temperature, :fingers_status_id, :gastrointestinal_symptoms_id, :other_symptoms).merge(:user current_user.id, :employee params[:employee_id] )
    end
  end
end
