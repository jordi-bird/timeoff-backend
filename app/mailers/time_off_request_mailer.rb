class TimeOffRequestMailer < ApplicationMailer
    def status_update(request)
      @request = request
      @employee = request.employee
  
      mail(
        to: @employee.email,
        subject: "Your time off request has been #{@request.status.humanize.downcase}"
      )
    end
  end
  