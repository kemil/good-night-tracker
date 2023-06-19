class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def follow
    @user = User.find(params[:id])
    @following = User.find(params[:following_id])

    respond_to do |format|
      unless @user.followings.include?(@following)
        @user.followings << @following
        format.html { redirect_to user_url(@user), notice: "User was successfully follow #{@following.name}." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: "#{@user.name} already follow #{@following.name}.", status: :unprocessable_entity }
      end
    end
  end

  def unfollow
    @user = User.find(params[:id])
    @followed_users = @user.followed_users.find_by(following_id: params[:following_id])

    respond_to do |format|
      if @followed_users
        @followed_users.destroy
        format.html { redirect_to user_url(@user), notice: "User was successfully unfollow #{@followed_user.name}." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: "Unsuccessfully unfollow #{@user.name}.", status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.includes(:followers, :followings).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name)
    end
end
