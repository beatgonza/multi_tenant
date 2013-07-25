require 'spec_helper'

describe ApplicationController do

  context "current account" do
    it "should scope depending on the current account" do
      pending
      current_account = FactoryGirl.create(:account).id
      @controller = ApplicationController.new
      @controller.instance_eval{ scope_current_account }
      Account.current_id.should == current_account.id
    end
  end

end