require "prawn"

class PdfCreator
  def initialize(subscribers)
    @subs=subscribers
  end

  def render()
    pdf = Prawn::Document.new
    table_data = Array.new
    table_data << ["Name","E-mail","Phone"]
    @subs.each do |p|
      table_data << [p.name, p.email,p.phone]
    end
    pdf.table(table_data, :width => 500, :cell_style => { inline_format: true })
    pdf.render
  end
end
