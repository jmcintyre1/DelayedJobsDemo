class DelayedJobsController < ApplicationController
  
  def show
    @delayed_job = Delayed::Job.find(params[:id])
  end

  def destroy
    @delayed_job = Delayed::Job.find(params[:id])
    @delayed_job.destroy

  	redirect_to delayed_jobs_path
  end

  def index
    @delayed_jobs = if params[:term]
        Delayed::Job.where('id LIKE ? OR queue LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%")
    else
        Delayed::Job.all
    end
  end

  def run
    Delayed::Worker.new.run(Delayed::Job.find(params[:id])) 

    redirect_to delayed_jobs_path
  end

  private
  def delayed_job_params
    params.require(:delayed_job).permit(:id, :queue)
  end

end
