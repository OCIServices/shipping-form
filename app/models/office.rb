class Office < ActiveRecord::Base
  scope :name_contains, (lambda do |str|
                              {:conditions => ['lower(name) like ?', "%#{str.downcase}%"]}
                            end )

end
