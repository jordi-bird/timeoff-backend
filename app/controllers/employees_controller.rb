class EmployeesController < ApplicationController
  def index
    employees = Employee.includes(:time_off_requests)
    render json: employees, include: :time_off_requests 
  end


  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email)
  end
end
