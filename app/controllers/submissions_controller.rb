class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    @expert = @submission.expert
  end

  def new
    @questions = Question.all
    @submission = Submission.new
  end

  def edit
  end

  def create
    @submission = Submission.create(submission_params)
    @submission.ip = request.remote_ip

    Question.uniq.pluck(:id).each do |qid|
      aid = params[qid]
      @submission.add_answer(aid)
    end

    if @submission.save
      redirect_to submission_path(@submission)
    else
      redirect_to new_submissions_path(@submision)
    end
  end

  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
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
