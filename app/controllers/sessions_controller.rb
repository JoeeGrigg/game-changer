class SessionsController < ApplicationController
  before_action :get_session

  def show
    redirect_to "/" unless @session
    @challenge = @session.next_challenge if @session
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
    return redirect_to_session if @session.started?
    @session.start!
    redirect_to_session
  end

  def next
    @session_game_challenge = @session.session_game_challenges.find(next_params[:session_game_challenge_id])
    @session_game_challenge.update!(done: true, winner_id: next_params[:winner_id])
    @session.update!(status: :complete) if @session.next_challenge.nil?
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

  def next_params
    params.require(:session_game_challenge).permit(:session_game_challenge_id, :winner_id)
  end
end
