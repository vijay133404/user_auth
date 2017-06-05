class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /states
  # GET /states.json
  def index
    @states = State.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
    @commentable = State.find(params[:id])
    @comment = Comment.new
  end

  def states_show
  @state =  State.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/states/states_show.js.erb" } # create a file named inline_edit.js.erb
  end
end
  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  def states_edit
  @state =  State.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/states/states_edit.js.erb" } # create a file named inline_edit.js.erb
  end
end

  # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        @states = State.all
         format.js { render :file => 'states/update_state.js.erb', notice: 'Company was successfully updated.' } 
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

 

def comments
    
      @commentable = State.find(params[:id])
      @comment = @commentable.comments.create(comment_params)
      # @comment.title = "First comment."
      # @comment.comment = "This is the first comment."
      @comment.save
       redirect_to state_path
   end

  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: 'State was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def get_states
 @states= State.where(:country_id=>params[:country]) 
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end


  def comment_params

  params.require(:comment).permit(:title,:comment)
   end
    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:state_name,:country_id)
    end
end
