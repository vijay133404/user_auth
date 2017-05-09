class RegionsController < InheritedResources::Base

  private

    def region_params
      params.require(:region).permit(:region_name)
    end
end

