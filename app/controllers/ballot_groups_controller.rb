class BallotGroupsController < ApplicationController
  def index
    @ballot_groups = BallotGroup.all.page(params[:page]).per(25)
  end

  def new
    @ballot_group = BallotGroup.new
  end

  def edit
    @ballot_group = BallotGroup.find(params[:id])
  end

  def create
    @ballot_group = BallotGroup.new(house_params)
    if @ballot_group.save
      redirect_to @ballot_group
    else
      render 'new'
    end
  end

  def update
    @ballot_group = BallotGroup.find(params[:id])
    if @ballot_group.update(ballot_group_params)
      redirect_to @ballot_group
    else
      render 'edit'
    end
  end

  def show
    @ballot_group = BallotGroup.eager_load(:members).find(params[:id])
  end

  def destroy
    @ballot_group = BallotGroup.find(params[:id])
    @ballot_group.destroy
    redirect_to ballot_groups_path
  end

  private
  def ballot_group_params
    params.require(:ballot_group).permit(:name, :owner)
  end
end