class TagsController < ApplicationController
    def index
        @user = User.find_by(user_session: cookies[:user_session])
        @tags = @user.tags
    end

    def show
        @user = User.find_by(user_session: cookies[:user_session])
        @tasks = @user.tasks.where(tag_id: params[:id])
        @tag = Tag.find(params[:id])
        @tags_selection = [[@tag.name, @tag.id]]
        render 'tasks/index'
    end

    def create
        @user = User.find_by(user_session: cookies[:user_session])
        @tag = @user.tags.create(tag_params)

        redirect_to user_tags_url
    end

    def update
        @user = User.find_by(user_session: cookies[:user_session])
        @tag = @user.tags.find(params[:id])

        if @tag.update(tag_params)
            redirect_to user_tags_url
        else
            render root_path
        end
    end

    def destroy
        @user = User.find_by(user_session: cookies[:user_session])
        @tag = @user.tags.find(params[:id])
        @tag.destroy

        redirect_to user_tags_url
    end

    private
        def tag_params
            params.require(:tag).permit(:name, :color, :priority)
        end
end
