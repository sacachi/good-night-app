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

      def follow
        @user = User.find(params[:id])
        return unless @user

        relationship = @user.followings.new(followed_id: params[:followed_id])
        if relationship
          render json: {status: :ok, message: 'You following success'}
        else
          render json: {status: :forbidden, message: 'Forbidden'}
        end
      end

      def unfollow
        @user = User.find(params[:id])
        return unless @user

        relationship = @user.following_users.find_by(followed_id: params[:followed_id])
        if relationship&.destroy
          render json: {status: :ok, message: 'You unfollow success'}
        else
          render json: {status: :forbidden, message: 'Forbidden'}
        end
      end

      def following_users
        @user = User.find(params[:id])
        return unless @user

        @following_users = @user.following_users.order(created_at: :desc)
                                .includes(:sleep_trackers)
                                .page params[:page]
      end

      def followed_users
        @user = User.find(params[:id])
        return unless @user

        @followed_users = @user.followed_users.order(created_at: :desc).page params[:page]
      end

      def track_sleep
        @user = User.find(params[:id])
        return unless @user

        @track_sleep = @user.sleep_trackers.new(user_id: @user.id,
                                                sleep_time: params[:sleep_time],
                                                waking_time: params[:waking_time])
        if @track_sleep.save
          render json: {status: :ok, message: 'You updated success'}
        else
          render json: {status: :forbidden, message: 'Forbidden'}
        end
      end
    end
  end
end
