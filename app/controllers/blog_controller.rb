class BlogController < ApplicationController
    def index
        @posts = Post.all.reverse
    end
    
    def create
        Post.create(writer:params[:name], title:params[:title], contents:params[:contents])
        redirect_to:root
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to:root
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        pp = Post.find(params[:id])
        pp.writer = params[:name]
        pp.title = params[:title]
        pp.contents = params[:contents]
        pp.save
        redirect_to:root
    end
    
    def contents
        @posts = Post.find(params[:id])
    end
    
    def comment
        Comment.create(msg: params[:comment], post_id: params[:post_id])
        redirect_to :back
    end
end