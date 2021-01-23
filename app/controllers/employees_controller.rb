class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instance, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.includes(:user).where("user_id = ?", current_user.id).order('created_at ASC')
  end

  def new
    @employee = Employee.new
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      redirect_to root_path
    else
      @employee = Employee.new
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @employee.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :employee_number).merge(user_id: current_user.id)
  end

  def set_instance
    @employee = Employee.find(params[:id])
  end
end
