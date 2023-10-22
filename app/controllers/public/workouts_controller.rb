class Public::WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params.merge(:customer_id=>current_customer.id))
    if @workout.save!
      flash[:success] = "投稿に成功しました"
      redirect_to workout_path(@workout.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @workouts = params[:tag_id].present? ? Tag.find(params[:tag_id]).workouts : Workout.all
    if params[:keyword]
      @workouts = @workouts.search(params[:keyword]).all
    else
      @workouts = @workouts.all
    end
    @keyword = params[:keyword]
  end

  def show
    @workout = Workout.find(params[:id])
    @workout_comment = WorkoutComment.new
  end

  def destroy
    Workout.find(params[:id]).destroy
    flash[:success] = "削除に成功しました。"
    redirect_to workouts_customer_path(current_customer.id)
  end

  private
  def workout_params
    params.require(:workout).permit(:name, :introduction, {images: []}, tag_ids: [] )
  end
end
