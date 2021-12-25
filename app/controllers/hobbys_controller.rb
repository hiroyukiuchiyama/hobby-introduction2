class HobbysController < ApplicationController
      before_action :ensure_correct_user, only:[:edit, :update,:destroy]
    
     def show
         @hobby = Hobby.find(params[:id])
         @user = @hobby.user
         @hobbys = Hobby.new
         @hobbys.build_hobby_image
     end
     
     def index 
         @hobby = Hobby.new
         @hobbys = Hobby.all
         @hobby.build_hobby_image
         
     end
     
     def create
        @hobby = Hobby.new(hobby_params)
        @hobby.score = Language.get_data(hobby_params[:body])  #この行を追加
        @hobby.user_id = current_user.id
      if @hobby.save
        redirect_to hobby_path(@hobby), notice: "You have created hobby successfully."
      else
        @hobbys = Hobby.all
        render 'index'
      end
     end
     
     def edit
        @hobby = Hobby.find(params[:id])
     end
     
     def update
      @hobby = Hobby.find(params[:id])
      if @hobby.update(hobby_params)
          redirect_to hobby_path(@hobby), notice: "You have updated hobby successfully."
      else
          render 'edit'
      end
     end
     
     def destroy
         @hobby = Hobby.find(params[:id])
         @hobby.destroy
         redirect_to hobbys_path 
     end
    
    
    private
    
    def hobby_params
        params.require(:hobby).permit(:title, :body,:rate, hobby_image_attributes: [:image])
        
    end
end