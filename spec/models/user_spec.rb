require 'spec_helper'

describe User do
  context "Relations" do
    it { should have_and_belong_to_many :accounts }
  end

  context "Scopes" do
    it "should return users based on current account" do
      account = FactoryGirl.create(:account)
      Account.current_id = account.id
      user1 = FactoryGirl.create(:user)
      user1.accounts << account
      user2 = FactoryGirl.create(:user)
      User.all.should == [user1]
    end 
  end

  it "should require an email address" do
    no_email_user = FactoryGirl.build(:user, email: "")
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = FactoryGirl.build(:user, email: address)
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = FactoryGirl.build(:user, email: address)
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    FactoryGirl.create(:user, email: "test@gmail.com")
    user_with_duplicate_email = FactoryGirl.build(:user, email: "test@gmail.com")
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end

  end

  describe "password validations" do

    it "should require a password" do
      FactoryGirl.build(:user, :password => "", :password_confirmation => "").should_not be_valid
    end

    it "should require a matching password confirmation" do
      FactoryGirl.build(:user, :password => "password", :password_confirmation => "invalid").should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      FactoryGirl.build(:user, :password => short, :password_confirmation => short).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

end
