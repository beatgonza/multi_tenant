class Account < ActiveRecord::Base
  attr_accessible :name, :subdomain, :logo, :color

  has_and_belongs_to_many :users

  validates :subdomain, :format => { :with => /\A\w+\z/ },
                    	 :presence => true,
                       :uniqueness => true

  mount_uploader :logo, LogoUploader
  
  def self.current_id=(id)
    Thread.current[:account_id] = id
  end

  def self.current_id
    Thread.current[:account_id]
  end

end
