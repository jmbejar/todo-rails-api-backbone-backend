class SubscriptorsController < ActionController::Base

  before_action :find_subscriptor, only: :unsubscribe

  def unsubscribe_form
  end

  def unsubscribe
    if @subscriptor
      @error = "Something went wrong" unless @subscriptor.destroy
    else
      @error = "Email #{email_param} not found"
    end
  end

  private

  def find_subscriptor
    @subscriptor = Subscriptor.find_by_email(email_param)
  end

  # Only allow a trusted parameter "white list" through.
  def email_param
    params.require(:subscriptor).require(:email)
  end
end
