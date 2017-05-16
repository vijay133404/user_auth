class NodesController < InheritedResources::Base

def nodes_edit
  @node = Node.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/nodes/nodes_edit.js.erb" } # create a file named inline_edit.js.erb
  end
end



  private

    def node_params
      params.require(:node).permit(:node_name, :place_id)
    end
end

