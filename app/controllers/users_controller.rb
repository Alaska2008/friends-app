class UsersController < ApplicationController
   
    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render: user.errors.full_messages
        end    
    end

    def updated
        user = User.find_by(id:params[:id])
        if user
            user.update(user_params)
            render json: user, status: :accepted
        else
            render json: {error: "user not found"}, status: :not_found
        end
    end

    def index
        users = User.all
        render json: users, status: :ok
    end

    def show
        user = User.find_by(id:params[:id])
        if user
            render json: user, status: :ok
        else
            render json: {error: "user not found"}, status: :not_found
        end    
    end

    def destroy
        user = User.find_by(id:params[:id])
        user.destroy
    end


    private
    def user_params
        params.permit(:first_name, :last_name, :age,:city, :country, :img_url, :description)
    end


end
