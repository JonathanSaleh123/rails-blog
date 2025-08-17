class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        if @comment.save
            redirect_to @post, notice: 'Comment was successfully created.'
        else
            redirect_to @post, alert: 'Error creating comment.'
        end
    end
    private
    def comment_params
        params.require(:comment).permit(:author, :body)
    end
end
