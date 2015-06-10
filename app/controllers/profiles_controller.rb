class ProfilesController < ApplicationController
  def new
    @profile = Profile.new(params[:profile])

    puts "!@!@!@@!@"
    puts @profile.save
    redirect_to @profile
  end

  def create
    @profile = Profile.new(params[:profile])
    puts "!@!@!@@!@"

    puts @profile.save
    redirect_to @profile
  end

  def show
  #  @profile = Profile.where(user_id: params[:id]).first
    @profile = Profile.find_by(user_id: params[:id])
    
  end

  def index

  end
end
