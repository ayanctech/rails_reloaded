class SubscribersController < ApplicationController
  before_action :seed_db, except: [:index]
  
  def index
    @subscribers = Subscriber.all
  end

  def download_pdf
    respond_to do |format|
      format.pdf do
        pdf = PdfCreator.new(@subscribers)
        send_data pdf.render,
          filename: "subscribers-#{Date.today}.pdf",
          type: "application/pdf",
          disposition: "attachment"
      end
    end
  end

  def download_csv
    respond_to do |format|
      format.html
      format.csv { send_data @subscribers.to_csv, filename: "subscribers-#{Date.today}.csv" }
    end
  end

  def send_mail
    if AdminMailer.data_table(@subscribers).deliver
      redirect_to (root_path), flash: { notice: "Mail sent"}
    else
      redirect_to (root_path), flash: { error: "Mail sending error"}
    end
  end

  private
  def seed_db
    if Subscriber.count < 50
      redirect_to (root_path), flash: { notice: "Seeding the DB is done...You can use the service now"}
      Rails.application.load_seed
    else
      @subscribers=Subscriber.all.order("name ASC")
    end
  end

end
