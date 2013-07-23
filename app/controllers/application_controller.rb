class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :scope_current_account

  private 

  def current_account
    Account.find_by_subdomain! request.subdomain if (request.subdomain.present? && request.subdomain != "www")
  end
  helper_method :current_account

  def scope_current_account
    Account.current_id = current_account.id if current_account
    yield
  ensure
    Account.current_id = nil
  end
end
