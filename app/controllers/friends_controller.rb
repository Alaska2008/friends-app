class FriendsController < ApplicationController
    def create
        friend = User.create(friend_params)
        if friend.valid?
            render json: friend, status: :created
        else
            render: friend.errors.full_messages
        end    
    end

    def updated
        friend = Friend.find_by(id:params[:id])
        if friend
            friend.update(friend_params)
            render json: friend, status: :accepted
        else
            render json: {error: "production not found"}, status: :not_found
        end
    end

    def index
        friends = Friend.all
        render json: friends, status: :ok
    end

    def show
        friend = Friend.find_by(id:params[:id])
        if friend
            render json: friend, status: :ok
        else
            render json: {error: "friend not found"}, status: :not_found
        end    
    end

    def destroy
        friend = Friend.find_by(id:params[:id])
        friend.destroy
    end


    private
    def friend_params
        params.permit(:first_name, :last_name, :age,:city, :country, :img_url, :description)
    end
end
