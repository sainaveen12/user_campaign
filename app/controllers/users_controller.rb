class UsersController < ApplicationController

    def index
        @users = User.page(params[:page]).per(10)
        render json: {
            users: @users,
            current_page: @users.current_page,
            total_pages: @users.total_pages,
            next_page: @users.next_page,
            prev_page: @users.prev_page,
            total_count: @users.total_count
        }
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user,status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def filter
        campaign_names = params[:campaign_names].split(',')
        conditions = campaign_names.map do |name|
            "JSON_UNQUOTE(JSON_EXTRACT(campaigns_list, '$[*].campaign_name')) LIKE '%#{name}%'"
        end.join(" OR ")
        @users = User.where(conditions).page(params[:page]).per(10)
        render json: {
            users: @users,
            current_page: @users.current_page,
            total_pages: @users.total_pages,
            next_page: @users.next_page,
            prev_page: @users.prev_page,
            total_count: @users.total_count
        }
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
    end
end
