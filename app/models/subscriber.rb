require "csv"

class Subscriber < ApplicationRecord
  def self.to_csv
    attributes = %w{name email phone}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
  
end
