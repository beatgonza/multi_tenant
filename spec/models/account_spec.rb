require 'spec_helper'

describe Account do

  it { should have_and_belong_to_many :users }
  it { should validate_presence_of :subdomain }
  it { should validate_uniqueness_of :subdomain }

  it "should accept valid account subdomains" do
    subdomains = %w[test test123 test1_2]
    subdomains.each do |subdomain|
      valid_subdomain = FactoryGirl.build(:account, subdomain: subdomain)
      valid_subdomain.should be_valid
    end
  end

  it "should reject invalid account subdomains" do
    subdomains = %w[test@ test.123 'test test3']
    subdomains.each do |subdomain|
      invalid_subdomain = FactoryGirl.build(:account, subdomain: subdomain)
      invalid_subdomain.should_not be_valid
    end
  end

end
