class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
    end

    def new
    end
    
    def edit
        @task = Task.find(params[:id])
    end

    def create
        @task = Task.new(task_params)

        @task.save
        redirect_to root_path
    end

    def update
        @task = Task.find(params[:id])

        if @task.update
            redirect_to 'edit'
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
                                         :end_date, :end_time, :description)
        end
end
