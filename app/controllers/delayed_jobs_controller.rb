class DelayedJobsController < ApplicationController
  helper_method :sort_column, :sort_direction

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
    elsif params[:category]
      Delayed::Job.where.not(last_error: 'null')
    else
      Delayed::Job.all
    end

    @delayed_jobs = @delayed_jobs.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page], :per_page => 15)
  end

  def run
    Delayed::Worker.new.run(Delayed::Job.find(params[:id])) 

    redirect_to delayed_jobs_path
  end

  def show_errors
    @error = true

    redirect_to delayed_jobs_path
  end

  private
  def delayed_job_params
    params.require(:delayed_job).permit(:id, :queue)
  end

  def sortable_columns
    ["id"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end