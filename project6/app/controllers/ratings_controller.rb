class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    if !user_signed_in?
      redirect_to welcomes_path
    end
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    if !user_signed_in?
      redirect_to welcomes_path
    end
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
    if !user_signed_in?
      redirect_to welcomes_path
    end
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
	
	current_score=User.find(Evaluate.find(@rating.evaluate_id).ratee_id).score
	new_num=User.find(Evaluate.find(@rating.evaluate_id).ratee_id).commented_num + 1
	new_score=(current_score+@rating.score)/new_num
	User.find(Evaluate.find(@rating.evaluate_id).ratee_id).update_attribute :score, new_score
	User.find(Evaluate.find(@rating.evaluate_id).ratee_id).update_attribute :commented_num, new_num
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:evaluate_id, :user_id, :group_id, :score, :comments)
    end
end
