class NodesController < InheritedResources::Base

  private

    def node_params
      params.require(:node).permit(:node_name, :place_id)
    end
end

