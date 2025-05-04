class TimeOffRequestsController < ApplicationController
  before_action :set_time_off_request, only: [:update]

  def create
    employee = Employee.find(params[:employee_id])
    time_off = employee.time_off_requests.new(time_off_params)
    if time_off.save
      render json: time_off, status: :created
    else
      render json: { errors: time_off.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @time_off_request.update(status: params[:status])
      render json: @time_off_request
    else
      render json: { errors: @time_off_request.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_time_off_request
    @time_off_request = TimeOffRequest.find(params[:id])
  end

  def time_off_params
    params.require(:time_off_request).permit(:start_date, :end_date, :reason)
  end
end
