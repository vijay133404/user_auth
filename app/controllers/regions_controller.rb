class RegionsController < InheritedResources::Base

def region_edit
  @region = Region.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/regions/region_edit.js.erb" } # create a file named inline_edit.js.erb
  end
end
def region_show
  @region = Region.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/regions/region_show.js.erb" } # create a file named inline_edit.js.erb
  end
end

 def show
   @region = Region.find(params[:id])
  @commentable= Region.find(params[:id])
  @comment=Comment.new
 end


def update
	@region = Region.find(params[:id])
       respond_to do |format|

      if @region.update(region_params)
         @regions = Region.all
        format.js { render :file => 'regions/update_region.js.erb', notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end
 
   def comments123 
    @commentable= Region.find(params[:id])
    @comment= @commentable.comments.create(comment_params)
    @comment.save
    redirect_to region_path
  end
  private
    def comment_params
      params.require(:comment).permit(:title,:comment)
    end
    def region_params
      params.require(:region).permit(:region_name,:resion_id)
    end
end

