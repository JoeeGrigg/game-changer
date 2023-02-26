file = File.read("db/seeds.json")
data = JSON.parse(file)

data.each do |game, challenges|
  game = Game.create!(name: game)
  challenges.each do |challenge|
    game.challenges.create!(challenge)
  end
end