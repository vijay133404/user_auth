class RegionsController < InheritedResources::Base

def region_edit
  @region = Region.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/regions/region_edit.js.erb" } # create a file named inline_edit.js.erb
  end
end




  private

    def region_params
      params.require(:region).permit(:region_name,:resion_id)
    end
end

