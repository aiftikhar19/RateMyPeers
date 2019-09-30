 class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end
    if user_signed_in? and current_user.try(:admin?)
      @groups = Group.where(user_id: current_user)
    else
      @groups = Group.all
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end

  end

  # GET /groups/new
  def new
    # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end
    # Create a new group
    @group = current_user.groups.build
  end

  # GET /groups/1/edit
  def edit
     # URL redirection to home page if user is not signed in
    if !user_signed_in?
      redirect_to welcomes_path
    end
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = current_user.groups.build(group_params)
    # Create and save a group
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    # Update a group
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    Evaluate.all.collect.each do |evaluate|
      if evaluate.group_id == @group.id
        evaluate.destroy
      end
    end

    # Remove all Ratings for a selected group
    Rating.all.collect.each do |rating|
      if rating.group_id == @group.id
        rating.destroy
      end
    end

    # Remove members of a group
    for i in @group.membership_ids
      Membership.find(i).destroy
    end

    # Remove the group
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:gname, :course_id, :user_id)
    end
end
