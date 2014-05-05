AD_SETTINGS = {
  :host => 'dc01.ucalpha.com',
  :base => 'dc=ucalpha,dc=com',
  :port => 389,
  :auth => {
    :method => :simple,
    :username => ENV["AD_SERVICE_ACCOUNT_USERNAME"],
    :password => ENV["AD_SERVICE_ACCOUNT_PASSWORD"]
  }
}
