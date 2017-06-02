class CommentsController < ApplicationController


  def create

       @node = Node.find(params[:node_id])
       @comment=@node.comments.create(comment_params)
   
       @comment.save
        respond_to do |format|
        format.js { render :file => "nodes/create_comments.js.erb" }
        format.html { render :file => "nodes/create_comments.js.erb" }

    end
  end
  def upvote

    @comment= Comment.find(params[:id])
     @comment.upvote_by current_user
     respond_to do |format|
      format.js { render :file =>'comments/comments.js.erb'}
      end
   end


   def downvote
     @comment= Comment.find(params[:id])
     @comment.downvote_by current_user
     respond_to do |format|
      format.js { render :file =>'comments/comments.js.erb'}
   end
end
  private    
    def comment_params
      params.require(:comment).permit(:comment,:title,:node_id)
      
    end


end
