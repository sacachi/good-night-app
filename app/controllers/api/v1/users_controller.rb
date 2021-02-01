module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.includes(:following_users, :sleep_trackers)
                     .order(created_at: :desc).page params[:page]
        @total = @users.total_count
      end

      def sleep_trackers
        @user = User.find(params[:id])
        @sleep_trackers = @user.sleep_trackers
                               .order(duration: :desc)
                               .page params[:page]
        @total = @sleep_trackers.total_count
      end
    end
  end
end
