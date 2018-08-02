class JobItemsController < ApplicationController
  def new
  end

  def create
    @job = JobItem.new(job_params)
 
    @job.save
    redirect_to job_items_path
  end

  def show
    @job = JobItem.find(params[:id])
  end

  def destroy
    @job = JobItem.find(params[:id])
    @job.destroy

    redirect_to job_items_path
  end

  def talk
    @job = JobItem.find(params[:id])
  	JobItemsController.delay(:queue => "talk", :priority => 8).speak(@job)
  end

  def self.speak(job)
    job.title = job.title
    p "hello"
  end

  def index
    @job_items = JobItem.all
  end

  private
  def job_params
    params.require(:job).permit(:title)
  end
end