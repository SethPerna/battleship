# require './lib/board'
# require './lib/cell'
# require './lib/ship'
# #require './lib/ai'
#
# RSpec.describe do
#   xit "prints welcome message" do
#   end
#
#   it "checks AI #valid_placement? for cruiser" do
#     computer = Computer.new
#     computer.ai_place_cruiser
#
#     expect(computer.board.cells.values.count { |value| value.ship == nil}).to eq 13
#   end
#
#   it "checks AI #valid_placement? for submarine" do
#     computer = Computer.new
#     computer.ai_place_cruiser
#     computer.ai_place_submarine
#
#     expect(computer.board.cells.values.count { |value| value.ship == nil}).to eq 11
#   end
# end
