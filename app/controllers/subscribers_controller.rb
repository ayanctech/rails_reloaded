class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def download_pdf
    if Subscriber.count < 50
      redirect_to (root_path), flash: { error: "Not Enough Database values ! Seed the DB first"}
      Rails.application.load_seed
    else
      @subscribers=Subscriber.all.order("name ASC")
      respond_to do |format|
        format.pdf do
          pdf = PdfCreator.new(@subscribers)
          send_data pdf.render,
            filename: "subscribers-#{Date.today}.pdf",
            type: "application/pdf",
            disposition: "inline"
        end
      end
    end
  end

  def download_csv
    if Subscriber.count < 50
      redirect_to (root_path), flash: { error: "Not Enough Database values ! Seed the DB first"}
      Rails.application.load_seed
    else
      @subscribers=Subscriber.all.order("name ASC")
      respond_to do |format|
        format.html
        format.csv { send_data @subscribers.to_csv, filename: "subscribers-#{Date.today}.csv" }
      end
    end
  end

  def send_mail
    if Subscriber.count < 50
      redirect_to (root_path), flash: { error: "Not Enough Database values ! Seed the DB first"}
      Rails.application.load_seed
    else
      @subscribers=Subscriber.all.order("name ASC")
      if AdminMailer.data_table(@subscribers).deliver
        redirect_to (root_path), flash: { notice: "Mail sent"}
      else
        redirect_to (root_path), flash: { error: "Mail sending error"}
      end
    end
  end

end
