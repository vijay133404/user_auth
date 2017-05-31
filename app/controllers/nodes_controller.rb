class NodesController < InheritedResources::Base

def nodes_edit
  @node = Node.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/nodes/nodes_edit.js.erb" } # create a file named inline_edit.js.erb
  end
end

def nodes_show
  @node = Node.find(params[:id])
  respond_to do |format|
    format.js { render :file => "/nodes/nodes_show.js.erb" } # create a file named inline_edit.js.erb
  end
end
def update
	@node = Node.find(params[:id])
       respond_to do |format|

      if @node.update(node_params)
         @nodes = Node.all
        format.js { render :file => 'nodes/update_nodes.js.erb', notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @node }
      else
        format.html { render :edit }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end
    def upvote 
      @node = Node.find(params[:id])
     @node.upvote_by current_user
     redirect_to @node
    end  

    def downvote
     @node = Node.find(params[:id])
      @node.downvote_by current_user
       redirect_to @node
    end  
    



  private

    def node_params
      params.require(:node).permit(:node_name, :place_id)
    end
end

