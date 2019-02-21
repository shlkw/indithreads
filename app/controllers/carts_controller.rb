class CartsController < ApplicationController


  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_movies = Movie.find(cart_ids)
  end

  def add
    $redis.sadd current_user_cart, params[:movie_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:movie_id]
    render json: current_user.cart_count, status: 200
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end

  def cart_count
  $redis.scard "cart#{id}"
end

end