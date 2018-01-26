class TasksController < ApplicationController
    def index
        @task = Task.all
    end
    
    def show
    end

    def new
    end
    
    def edit
    end

    def create
        @task = Task.new(task_params)

        if @task.save
        end
    end

    def update
        @task = Task.find(params[:id])

        if @task.update
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
    end

    private
        def task_params
            params.require(:task).permit(:title, :start_date, :start_time,
                                         :end_date, :end_time, :description)
        end
end
