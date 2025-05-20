# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :find_current_session
      before_action :require_login

      private

      def find_current_session
        authenticate_with_http_token do |token, _|
          Current.session = Session.find_signed(token)
        end
      end

      def require_login
        head :unauthorized unless logged_in?
      end

      def logged_in?
        current_user.present?
      end

      def current_user
        Current.session&.user
      end
    end
  end
end
