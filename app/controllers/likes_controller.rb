class LikesController < ApplicationController
    def create
        if current_user.present?
            @like = current_user.likes.new(like_params)
            if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
            else
                flash[:notice] = "You liked a post"
            end
            redirect_to @like.post
        else
            redirect_to root_path, notice: "You must be logged in to like a post"
        end
    end

    
    def destroy
        @like = current_user.likes.find(params[:id])
        post = @like.post
        @like.destroy
        redirect_to post, notice: "You unliked a post"
    end

    private

    def like_params
        params.require(:like).permit(:post_id)
    end
end
