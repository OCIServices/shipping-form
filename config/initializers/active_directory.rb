AD_SETTINGS = {
  :host => 'dcfitr1.corp.cdw.com',
  :base => 'dc=corp,dc=cdw,dc=com',
  :port => 389,
  :auth => {
    :method => :simple,
    :username => ENV["AD_SERVICE_ACCOUNT_USERNAME"],
    :password => ENV["AD_SERVICE_ACCOUNT_PASSWORD"]
  }
}
