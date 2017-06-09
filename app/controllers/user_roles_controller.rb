class UserRolesController < ApplicationController
  before_action :set_user_role, only: [:show, :edit, :update, :destroy]

  # GET /user_roles
  # GET /user_roles.json
  def index
    @user_roles = UserRole.all
  end

  # GET /user_roles/1
  # GET /user_roles/1.json
  def show
   
    @commentable= UserRole.find(params[:id])
    @comment=Comment.new
 end
  
  def user_role_show
     @user_role = UserRole.find(params[:id])
      respond_to do |format|
        format.js { render :file => "/user_roles/user_show.js.erb" } 
        end
   end
  # GET /user_roles/new
  def new
    @user_role = UserRole.new
  end
  
   def user_role_edit
     @user_role = UserRole.find(params[:id])
      respond_to do |format|
        format.js { render :file => "/user_roles/user_edit.js.erb" } 
        end
   end


  # GET /user_roles/1/edit
  def edit
  end

  # POST /user_roles
  # POST /user_roles.json
  def create
    @user_role = UserRole.new(user_role_params)

    respond_to do |format|
      if @user_role.save
        format.html { redirect_to @user_role, notice: 'User role was successfully created.' }
        format.json { render :show, status: :created, location: @user_role }
      else
        format.html { render :new }
        format.json { render json: @user_role.errors, status: :unprocessable_entity }
      end
    end
  end
 def comments
     
      @commentable = UserRole.find(params[:id])
      @comment = @commentable.comments.create(comment_params)
      # @comment.title = "First comment."
      # @comment.comment = "This is the first comment."
      @comment.save
       redirect_to user_role_path
   end
  
  def update
     @user_role = UserRole.find(params[:id])
      respond_to do |format|
      if @user_role.update(user_role_params)
        @user_roles = UserRole.all
        format.js { render :file => "/user_roles/user_update.js.erb" } 
        format.json { render :show, status: :ok, location: @user_role }
      else
        format.html { render :edit }
        format.json { render json: @user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @user_role.destroy
    respond_to do |format|
      format.html { redirect_to user_roles_url, notice: 'User role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def comment_params
    params.require(:comment).permit(:title,:comment)
   end

    def set_user_role
      @user_role = UserRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_role_params
      params.require(:user_role).permit(:role_name)
    end
end
