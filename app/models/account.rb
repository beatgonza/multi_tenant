class Account < ActiveRecord::Base
  attr_accessible :name, :subdomain

  has_and_belongs_to_many :users
end
