class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # here we went ahead did the association already!
    @comment = @post.comments.build
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    3.times { @post.categories.build }
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  private

# remember that post.category_ids = [1] is the same as
# post.categories = [Category.find(1)]
# collection_singular_ids=ids
# Replace the collection with the objects identified by the primary keys in ids.
# This method loads the models and calls collection=.

  def post_params
    params.require(:post).permit(:title, :content, :categories_attributes => [:name], :category_ids => [] )
  end
end
