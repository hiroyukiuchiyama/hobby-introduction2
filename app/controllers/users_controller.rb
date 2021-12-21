class UsersController < ApplicationController
   before_action :ensure_correct_user, only: [:edit,:update,:destroy]

    def show
        @user = User.find(params[:id])
        @hobbys = @user.hobbies
        @hobby = Hobby.new
        @hobby.build_hobby_image
    end

    def index
        @users = User.all
        @hobby = Hobby.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def updae
        @user = User.find(params[:id])
        if @user.update(user_params)
         redirect_to user_path(@user), notice: "You have updated user successfully."
        else
         render 'edit'
        end
    end
end
