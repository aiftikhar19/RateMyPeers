class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :destroy]

  # GET /courses
  # GET /courses.json
  def index
     # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end
    # URL redirection to homepage if user signed in is not admin
    if user_signed_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
    # show all courses
    @courses = Course.where(user_id: current_user)
  end


  # GET /courses/1
  # GET /courses/1.json
  def show
    # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end

    # URL redirection to homepage if user signed in is not admin
    if user_signed_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
    # show all groups for a course
    @groups = Group.where(course_id: @course.id).all||nil

  end

  # GET /courses/new
  def new
   # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end

    # URL redirection to homepage if user signed in is not admin
    if user_signed_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
    # new course add page
    @course = current_user.courses.build
  end

  # GET /courses/1/edit
  def edit
    # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end

    # URL redirection to homepage if user signed in is not admin
    if user_signed_in? and !current_user.try(:admin?)
      redirect_to welcomes_path
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = current_user.courses.build(course_params)
    @course.semester = params[:semester]

    # Creates a new course and saves it
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    # remove all groups belonging to a course
    for i in 0...@course.group_ids.length
      Group.find(@course.group_ids[i]).destroy
    end
    # remove the course
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:cname, :semester, :user_id)
    end

end
