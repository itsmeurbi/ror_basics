class CommentsController < AuthController
  before_action :set_post

  def create
    comment = @post.comments.new(comment_params)
    if comment.save
      flash[:notice] = 'Post created!'
    else
      flash[:alert] = 'Error creating post!'
    end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user: current_user)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
