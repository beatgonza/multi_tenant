class Account < ActiveRecord::Base
  attr_accessible :name, :subdomain

  has_and_belongs_to_many :users

  validates :subdomain, :format => { :with => /\A\w+\z/ },
                    	 :presence => true,
                       :uniqueness => true

  def self.current_id=(id)
    Thread.current[:account_id] = id
  end

  def self.current_id
    Thread.current[:account_id]
  end

end
