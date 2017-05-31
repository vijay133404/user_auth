class LinksController < ApplicationController

		  def index
		    @links = Link.all

		  end
		   def new
		    
		    end
        def create
         
         @link = Link.new( link_params)
        
          if @link.save

            redirect_to links_path
            else
             render 'new'
             end		
          end
		def upvote 
		  @link = Link.find(params[:id])
		  @link.upvote_by current_user
		 redirect_to links_path
		end  

		def downvote
		  @link = Link.find(params[:id])
		  @link.downvote_by current_user
		  redirect_to links_path
		end


        private
          def link_params
          params.require(:link).permit(:title, :user_id,:created_at,:updated_at)
          end

end
