class EmployeesController < ApplicationController
  before_action :set_instance, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.includes(:user).where("user_id = ?", current_user.id).order('created_at ASC')
    today_checked
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to root_path
    else
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

  def today_checked
    @today_checked = []
    today = Date.today.strftime('%Y/%m/%d')

    @employees.each do |employee|
      conditions = employee.conditions
      isBreak = false
        conditions.each do |condition|
          if condition.created_at.strftime('%Y/%m/%d') == today
            @today_checked.push(0) #今日の健康チェックがあったときは0
            isBreak = true
            break
          end
        end
      next if isBreak
      @today_checked.push(1) #今日の健康チェックがなかったときは1
    end
  end
end
