module ApplicationHelper
  def resource_email
    resource.pending_reconfirmation? ? resource.unconfirmed_email : resource.email
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
