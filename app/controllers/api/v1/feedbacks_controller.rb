module Api
  module V1
    class FeedbacksController < ApplicationController
      before_action :set_feedback, only: [:show, :update, :destroy]

      # GET /feedbacks
      def index
        @feedbacks = Feedback.where("user_id = ?", current_user.id)

        render json: @feedbacks
      end

      # GET /feedbacks/1
      def show
        render json: @feedback
      end

      # POST /feedbacks
      def create
        @feedback = Feedback.new(feedback_params)
        @feedback.user = current_user

        if @feedback.save
          render json: @feedback, status: :created
        else
          render json: @feedback.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /feedbacks/1
      def update
        if @feedback.update(feedback_params)
          render json: @feedback
        else
          render json: @feedback.errors, status: :unprocessable_entity
        end
      end

      # DELETE /feedbacks/1
      def destroy
        @feedback.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_feedback
        @feedback = current_user.feedbacks.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def feedback_params
        params.require(:feedback).permit(:title, :description, :rating, :user_id)
      end
    end
  end
end
