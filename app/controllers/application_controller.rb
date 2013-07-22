class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_account
    Account.find_by_subdomain! request.subdomain
  end
  helper_method :current_account

  def scope_current_account
    Account.current_id = current_account.id
    yield
  ensure
    Account.current_id = nil
  end
end
