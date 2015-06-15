class DashboardController < ApplicationController
  def index
    @posts = Post.select("id, published, title").where(user_id: current_user.id, published: false).order(updated_at: :desc)
    #@posts = Post.all

    #u = User.first( :joins => :cities, :select => "users.*, cities.name AS city_name")

    #@posts = Post(:joins => :users, :select => "posts.*,users.email").where(user_id: current_user.id).order(updated_at: :desc)

    @published = Post.joins(:user).where(published: true).select("posts.*,users.email").order(updated_at: :desc)

  end
end
