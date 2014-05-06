class FormMailer < ActionMailer::Base
  default from: "videosupport@cdw.com"
  default to: "nick.mueller@cdw.com"
  
  def shipping_form_email(shipment)
    attachments["shipping_form_#{shipment.id}.pdf"] = File.read(ShippingPdfForm.new(shipment).export)
    mail(subject: 'New Shipping Request')
  end
end
