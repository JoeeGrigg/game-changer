class SessionsController < ApplicationController
  before_action :get_session

  def show
    redirect_to "/" unless @session
  end

  def create
    @session = Session.create!
    redirect_to_session
  end

  def update
    @session.status = :configuring_add_players
    @session.update!(session_params)
    redirect_to_session
  end

  def create_player
    @player = @session.players.create!(session_player_params)
    redirect_to_session
  end

  def start
    @session.start!
    redirect_to_session
  end

  private

  def get_session
    @session = Session.find_by(code: params[:session_code])
  end

  def redirect_to_session
    redirect_to "/#{@session.code}"
  end

  def session_params
    params.require(:session).permit(:name, :number_of_games, :rounds)
  end

  def session_player_params
    params.require(:session_player).permit(:name)
  end
end
