class UsersController < ApplicationController
     before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
     
     def follow
        @user = User.find(params[:id])
        current_user.followees << @user
        redirect_back(fallback_location: user_path(@user))
      end
      
      def unfollow
        @user = User.find(params[:id])
        current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_back(fallback_location: user_path(@user))
      end
      

      # GET /users
      # GET /users.json
      def index
        @users = User.all
      end
    
      # GET /users/1
      # GET /users/1.json
      def show
        @user = User.find(params[:id])
        @followers = @user.followers
        @followees = @user.followees
      end
    
      # GET /users/new
      def new
        @user = User.new
      end
    
      # GET /users/1/edit
      def edit
      end
    
      # POST /users
      # POST /users.json
      def create
        @user = User.new(user_params)
    
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'user was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /users/1
      # PATCH/PUT /users/1.json
      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'user was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /users/1
      # DELETE /users/1.json
      def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def user_params
          params.require(:user).permit(:name, :email, :profile_image)
        end
end
