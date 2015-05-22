class SubscriptorsController < ApplicationController

  # Modules that won't work in a rails app
  #
  # You could include them but not found methods or other errors will happen
  # depper in the stack if some of this features are used (eg. flash method)

  # include ActionController::Flash
  # include ActionController::Cookies


  # Modules not included in API Controllers that *can* be included if needed

  #include AbstractController::Translation
  #include AbstractController::AssetPaths
  #include ActionController::Helpers

  include ActionView::Layouts

  #include ActionController::EtagWithTemplateDigest
  #include ActionController::Caching
  #include ActionController::MimeResponds

  include ActionController::ImplicitRender

  #include ActionController::FormBuilder

  include ActionController::RequestForgeryProtection

  #include ActionController::Streaming
  #include ActionController::HttpAuthentication::Basic::ControllerMethods
  #include ActionController::HttpAuthentication::Digest::ControllerMethods
  #include ActionController::HttpAuthentication::Token::ControllerMethods
  #include ActionController::ParamsWrapper

  layout 'application'

  before_action :find_subscriptor, only: :unsubscribe

  def unsubscribe_form
  end

  def unsubscribe
    if @subscriptor
      @error = "Something went wrong" unless @subscriptor.destroy
    else
      @error = "Email #{subscriptor_params[:email]} not found"
    end

    render :unsubscribe_form if @error
  end

  private

  def find_subscriptor
    @subscriptor = Subscriptor.find_by_email(subscriptor_params[:email])
  end

  # Only allow a trusted parameter "white list" through.
  def subscriptor_params
    params.require(:subscriptor).permit(:email)
  end
end
