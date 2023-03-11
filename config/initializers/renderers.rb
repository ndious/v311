require 'prawn-html'

ActionController::Renderers.add :pdf do |pdf_options, _context_options|
  pdf = Prawn::Document.new(pdf_options)
  p render_to_string
  PrawnHtml.append_html(pdf, render_to_string)

  send_data(pdf.render, type: Mime[:pdf])
end
