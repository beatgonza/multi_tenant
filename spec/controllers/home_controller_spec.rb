require 'spec_helper'

describe HomeController do
  
  context "GET index" do

    it "is successfull" do
      account = FactoryGirl.create(:account)
      Account.current_id = account.id
      user1 = FactoryGirl.create(:user)
      user1.accounts << account
      sign_in user1
      get :index
      assigns(:users).should == [user1]
    end

  end

end