class CommentsController < ApplicationController
    def index
        @comments=Comment.all
    end
    def create
        @comments=Comment.all
        @comment=Comment.new(comment_params)
        if @comment.save
            redirect_to :back
            else
            render :action => 'index'
        end
    end
    private
    def comment_params
    params.require(:comment).permit(:name, :comment)
    end
end
