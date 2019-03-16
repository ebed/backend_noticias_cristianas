class PostsController < ApplicationController

    def index
        @posts = Post.all.order(fecha_publicacion: :desc)
         render json: @posts
    end

    def show
        @post = Post.find_by_slug(params[:id])
        render json: @post
    end
end