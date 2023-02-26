data = File.read("db/seeds.json")
games = JSON.parse(data, symbolize_names: true)

games.each do |game|
  g = Game.create!(game.except(:challenges))
  game[:challenges].each do |challenge|
    g.challenges.create!(challenge)
  end
end