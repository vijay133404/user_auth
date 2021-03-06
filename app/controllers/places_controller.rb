class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @commentable = Place.find(params[:id])
    @comment = Comment.new
  end
 def user_login
        
        respond_to do |format|
         
        format.js { render :file => "/devise/user_login.js.erb" } 
   end
  end

 
 def place_show
   @places = Place.all
      @place = Place.find(params[:id])
      respond_to do |format|
       format.js { render :file => "/places/place_show.js.erb" }
   
      end
    end
  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end
   
   def place_edit
      @place = Place.find(params[:id])
      respond_to do |format|
       format.js { render :file => "/places/place_edit.js.erb" }
   
      end
    end




  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
     @place = Place.find(params[:id])
     respond_to do |format|
      if @place.update(place_params)
         @places = Place.all
         format.js { render :file => "/places/place_update.js.erb" }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def comments

   @commentable = Place.find(params[:id])
   @comment = @commentable.comments.create(comment_params)
   @comment.save
   redirect_to place_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end
 
   def comment_params
    params.require(:comment).permit(:title,:comment)
    end
   
    def place_params
      params.require(:place).permit(:place_name, :company_id)
    end
end
