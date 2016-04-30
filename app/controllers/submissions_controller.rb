class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @questions = Question.all.order(:id)
    @submission = Submission.new
  end

  def edit
  end

  def create
    @submission = Submission.create(submission_params)
    @submission.ip = request.remote_ip

    Question.uniq.pluck(:id).each do |qid|
      aid = params[qid.to_s]
      @submission.add_answer(aid)
    end

    if @submission == nil || @submission.answers.count != Question.count
        flash[:notice] = "Please answer all questions!"
        redirect_to "/"                
    elsif @submission.save
      redirect_to submission_path(@submission)
    else
      redirect_to new_submissions_path(@submision)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.fetch(:submission, {})
    end
end
