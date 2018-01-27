class TasksController < ApplicationController
    def index
        if cookies[:user_session] === nil
            #Force session to generate
            session[:foo] = 'bar'
            cookies.permanent[:user_session] = session.id
            User.create(user_session: session.id)
        end
        @user = User.find_by(user_session: cookies[:user_session])
        @user.last_login = Time.now
        @tasks = @user.tasks
        @tags = @user.tags
        @tags_selection = []
        @user.tags.each do |tag|
            @tags_selection.push([tag.name, tag.id])
        end

    end
    
    def edit
        @user = User.find_by(user_session: cookies[:user_session])
        @task = @user.tasks.find(params[:id])
    end

    def create
        @user = User.find_by(user_session: cookies[:user_session])
        @task = @user.tasks.create(task_params)

        redirect_to root_path
    end

    def update
        @user = User.find_by(user_session: cookies[:user_session])
        @task = @user.tasks.find(params[:id])

        if @task.update(task_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find_by(user_session: cookies[:user_session])
        @task = @user.tasks.find(params[:id])
        @task.destroy

        redirect_to root_path
    end

    private
        def task_params
            params.require(:task).permit(:title, :start_date, :start_time,
                                         :end_date, :end_time, :description, 
                                         :user_session, :tag_id)
        end
end
