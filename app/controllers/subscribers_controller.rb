class SubscribersController < ApplicationController

  def index
    @subscribers = Subscriber.all
  end

  def download_pdf
    @employees=Employee.all.order("name ASC")
    respond_to do |format|
      format.pdf do
        pdf = PdfCreator.new(@employees)
        send_data pdf.render,
          filename: "Employees-#{Date.today}.pdf",
          type: "application/pdf",
          disposition: "attachment"
      end
    end
  end

  def download_csv
    @subscribers=Subscriber.all.order("name ASC")
    respond_to do |format|
      format.html
      format.csv { send_data @subscribers.to_csv, filename: "subscribers-#{Date.today}.csv" }
    end
  end

  def send_mail
    @students=Student.all.order("name ASC")
    if AdminMailer.data_table(@students).deliver
      redirect_to (root_path), flash: { info: "Mail sent"}
    else
      redirect_to (root_path), flash: { danger: "Mail sending error"}
    end
  end

end
