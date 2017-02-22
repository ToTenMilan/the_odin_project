require 'game'
require 'board'
require 'player'

describe "Basic classes" do
  let(:game) { Game.new }
  let(:board) { Board.new }
  let(:player_one) { Player.new }
  # let(:player_two) { Player.new }
  
  it "return instance of Game class" do
    expect(game).to be_instance_of Game
  end
  it "return instance of Board class" do
    expect(board).to be_instance_of Board
  end
  it "return instance of Player class" do
    expect(player_one).to be_instance_of Player
  end
end

describe "Game" do
  let(:game) { Game.new }
  let(:board) { Board.new }
  
  context "#new" do
    it "return initialized board 7-horiz. X 6-vert. with 'space' as ampty slot" do
      expect(game.board).to eq Array.new(7, Array.new(6, " "))
    end
    it "return array of two players" do
      expect(game.players.length).to == 2
    end
  end
  
  it { is_expected.to respond_to(:play) }
end

describe "Board" do
  # y - yellow coin
  # r - red coin
  # 'player_one' overwritten temporarily with his coin value
  let(:player_one) { "y" }
  # 'player_two' overwritten temporarily with his coin value
  let(:player_two) { "r" }
              # let(:board) { Board.new(Array.new(7, Array.new(6, " "))) }
  before(:each) do
    @board = Board.new(Array.new(7, Array.new(6, " ")))
    @first_board_state = [ ["y", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "] ]
    @second_board_state = [ ["y", "r", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "] ]
    @third_board_state = [ ["y", "r", "r", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "],
                            [" ", " ", " ", " ", " ", " ", " "] ]
  end
  let(:input) { @board[0] }
  # need to compare the result of 'move' to not empty row of the board
  context "#drop_coin" do
    it "drops coin to first row with no coins" do
      allow(@board).to receive(:move)
      expect(@board.move(player_one, input)).to eq @first_board_state
    end
    it "drops coin to first row with one coin of other player in it" do
      allow(@board).to receive(:move)
      expect(@board.move(player_two, input)).to eq @second_board_state
    end
    it "drops coin to first row with other player's coin at first place and own coin at second place" do
      allow(@board).to receive(:move)
      expect(@board.move(player_two, input)).to eq @third_board_state
    end
  end
end