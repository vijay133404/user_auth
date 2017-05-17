class RegionsController < InheritedResources::Base

def region_edit
  @region = Region.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/regions/region_edit.js.erb" } # create a file named inline_edit.js.erb
  end
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






  private

    def region_params
      params.require(:region).permit(:region_name,:resion_id)
    end
end

