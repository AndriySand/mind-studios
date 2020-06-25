class UsersController < ApplicationController
  include ActionController::Live
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    # select kind, sum(value) from records group by kind having count(kind) > 1 order by kind;
    # @records = Record.select('kind, sum(value) as val').group('kind').having("count(kind) > ?", 1).order('time')
    @records = Record.select('kind, value as val, time').where("id != ? AND id != 3", 6).order('time desc').limit(2)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

def stream
  1_000_000.times do |i|
    response.stream.write "This is line #{i}\n"
  end
ensure
  response.stream.close
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
