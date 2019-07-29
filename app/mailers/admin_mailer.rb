class AdminMailer < ApplicationMailer
  def data_table(subscribers)
    @subs=subscribers
    mail to: "actech.ayanc@gmail.com" , subject: "Requested Data Table"
  end
end
