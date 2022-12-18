class PostsController < ApplicationController
    def create
        @post = Post.new(post_params)
        if post.save
          render json: { post: @post }
        else
          render json: { message: 'Create error'}
        end
    end

    def index
        @posts = Post.all
        render json: { post: @posts }
    end

    def show
        @post = Post.find(params[:id])
        render json: { post: @post }
    end

    def update
        @post = Post.find(params[:id])
        if post.update(post_params)
            render json: { post: @post }
        else
            render json: { message: 'Update error!'}
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: { post: @post }
    end

    def post_params
        params.permit(:title, :body)
    end
end
