class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @commentable = Company.find(params[:id])
    @comment = Comment.new
  end

  def company_show
    @company = Company.find(params[:id])
    respond_to do |format|
    format.js { render :file => "/companies/comapny_show.js.erb" }
  end
end

  # GET /companies/new
  def new
    @company = Company.new

  end

  # GET /companies/1/edit
  def edit
    # respond_to do |format|
    #   if @company
    #     # format.html { render "edit_companies.js"  }
    #   end
    # end

  end

def inline_edit
    @company = Company.find(params[:id])
    respond_to do |format|
    format.js { render :file => "/companies/inline_edit.js.erb" } # create a file named inline_edit.js.erb
  end
end

 def upvote 
    @company = Company.find(params[:id])
    @company.upvote_by current_user
     respond_to do |format|
    format.js { render :file => 'companies/company.js.erb'}
     end
    end  

    def downvote
      @company = Company.find(params[:id])
      @company.downvote_by current_user
      respond_to do |format|
       format.html { redirect_to :back }
       format.js { render :file => 'companies/company.js.erb'}
       end  
    end

  def comments
       
      @commentable = Company.find(params[:id])
      @comment = @commentable.comments.create(comment_params)
      # @comment.title = "First comment."
      # @comment.comment = "This is the first comment."
      @comment.save
       redirect_to company_path
   end

  # def upvote
     
  #     @comment= Comment.find(params[:id])
  #     @comment.upvote_by current_user
  #    respond_to do |format|
  #     format.js { render :file =>'comments/comments.js.erb'}
  #     end
  #  end


  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
   
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|

      if @company.update(company_params)
         @companies = Company.all
        format.js { render :file => 'companies/update_company.js.erb', notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

private
    def comment_params
      params.require(:comment).permit(:title, :comment,:commentable)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :country_id, :state_id, :city_id, :postcode, :start_date, :active)
    end
end
