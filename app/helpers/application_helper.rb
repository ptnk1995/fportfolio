module ApplicationHelper
  def resource_email
    resource.pending_reconfirmation? ? resource.unconfirmed_email : resource.email
  end
end
