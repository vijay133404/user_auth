class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

 
  def show
    @commentable= City.find(params[:id])
    @comment = Comment.new

  end

 def cities_show
        @city = City.find(params[:id])
        respond_to do |format|
         
      format.js { render :file => "/cities/cities_show.js.erb" } 
   end
  end


  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end


  def cities_edit
        @city = City.find(params[:id])
        respond_to do |format|
         
      format.js { render :file => "/cities/cities_edit.js.erb" } 
   end
  end



  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end


 def get_cities 
   @cities= City.where(:state_id =>params[:state]) 

   end 
  
  def update
    respond_to do |format|
      @cities = City.all
      if @city.update(city_params)
         
         format.js { render :file => "/cities/cities_update.js.erb" } 
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

def comments
       
      @commentable = City.find(params[:id])
      @comment = @commentable.comments.create(comment_params)
      # @comment.title = "First comment."
      # @comment.comment = "This is the first comment."
      @comment.save
       redirect_to city_path
   end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   


  private

    def comment_params
      params.require(:comment).permit(:title, :comment,:commentable)
    end


    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:city_name,:state_id)
    end
end
