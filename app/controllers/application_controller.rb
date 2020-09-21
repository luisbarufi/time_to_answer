class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :check_pagination
  before_action :set_global_params
  around_action :switch_locale

  protected

    def layout_by_resource
      devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"
    end

    def check_pagination
      unless user_signed_in?
        params.extract!(:page)
      end
    end

    def set_global_params
      $global_params = params
    end

    def switch_locale(&action)
      cookies[:time_to_answer_locale] = params[:locale] if params[:locale]
      if current_user.present? && cookies[:time_to_answer_locale].present? && current_user.locale != cookies[:time_to_answer_locale]
        current_user.locale = cookies[:time_to_answer_locale]
        current_user.save
      end
      locale = current_user.try(:locale) || cookies[:time_to_answer_locale] || I18n.default_locale
      I18n.with_locale(locale, &action)
    end

end
