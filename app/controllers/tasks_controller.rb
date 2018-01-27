class TasksController < ApplicationController
    def index
        if cookies[:user_session] === nil
            #Force session to generate
            session[:foo] = 'bar'
            cookies.permanent[:user_session] = session.id
        end
        @tasks = Task.where("user_session = ?", cookies[:user_session])
        
    end
    
    def show
    end

    def new
    end
    
    def edit
        @task = Task.find(params[:id])
    end

    def create
        @task = Task.new(task_params.merge({:user_session => cookies[:user_session]}))

        @task.save
        redirect_to root_path
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy

        redirect_to root_path
    end

    private
        def task_params
            params.require(:task).permit(:title, :start_date, :start_time,
                                         :end_date, :end_time, :description, :user_session)
        end
end
