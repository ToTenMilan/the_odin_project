require 'game'
require 'board'
require 'player'

describe "Basic classes" do
  subject(:game) { Game.new }
  subject(:board) { Board.new }
  subject(:player_one) { Player.new("y") }
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

describe Game do
  subject(:game) { Game.new }
  subject(:board) { Board.new }
  
  context "#new" do
    it "return initialized board 7-horiz. X 6-vert. with 'space' as ampty slot" do
      expect(game.board).to be_instance_of Board #eq Array.new(7, Array.new(6, " "))
    end
    it "return array of two players" do
      expect(game.players.length).to eq 2
    end
  end
  
  context "#play" do
              # before do
              #   $stdin = 1
              # end
              # after do
              #   $stdin = STDIN
              # end
    it "runs the game" do
      expect(game).to respond_to(:play)
    end
    # xit "accept numbers only from range 1 to 7" do
    #   expect(game.play).to be_within(1).of(7)
    # end
    # xit 'returns 1 as input' do
    #   # subject.play
    #   # expect(subject.instance_variable_get(:@type)).to eq :input
    # end
  end
end

describe Board do
  # y - yellow coin
  # r - red coin
  subject(:player_one) { Player.new(color_one) }
  subject(:player_two) { Player.new(color_two) }
  let(:color_one) { "y" }
  let(:color_two) { "r" }
  let(:input) { 1 }
  
  before(:all) do
    @board = Board.new
  end
  
  context "#drop_coin" do
    it "drops three coins to single row, one yellow than two red" do
      expect(@board.drop_coin(input, player_one)).to eq @board.board[0][0]
      expect(@board.drop_coin(input, player_two)).to eq @board.board[0][1]
      expect(@board.drop_coin(input, player_two)).to eq @board.board[0][2]
    end
    
    ##### this test has been moved to #play because of infinite loop #####
    # xit "return input error if seventh coin is dropped to single row" do
    #   @board.board[0].map! { |e| e = "y" }
    #   p @board
    #   expect(@board.drop_coin(input, player_one)).to raise InputError
    # end
    
  end
  
  context "#show" do
    it "shows the board" do
      expect(@board).to respond_to(:show)
    end
    # it { is_expected.to respond_to(:show) }
  end
  
  context "#won?" do
    # before do
    #   @board.board[0][3], @board.board[0][4] = "r", "r"
    # end
    it "return true if player has connected 4 coins vertical" do
      @board.board[0][1] = 'r'
      @board.board[0][2] = 'r'
      @board.board[0][3] = 'r'
      @board.board[0][4] = 'r'
      expect(@board.won?("r")).to be true
    end
    it "return true if player has connected 4 coins horizontal" do
      @board.board[1][0] = 'y'
      @board.board[2][0] = 'y'
      @board.board[3][0] = 'y'
      @board.board[4][0] = 'y'
      expect(@board.won?("y")).to be true
    end
    it "return true if player has connected 4 coins diagonal slope down" do
      @board.board[1][1] = 'r'
      @board.board[2][2] = 'r'
      @board.board[3][3] = 'r'
      @board.board[4][4] = 'r'
      expect(@board.won?("r")).to be true
    end
    it "return true if player has connected 4 coins diagonal slope up" do
      @board.board[1][4] = 'y'
      @board.board[2][3] = 'y'
      @board.board[3][2] = 'y'
      @board.board[4][1] = 'y'
      expect(@board.won?("y")).to be true
    end
  end
  p @board
end

describe Player do
  subject(:player_one) { Player.new(color_one) }
  subject(:player_two) { Player.new(color_two) }
  let(:color_one) { "y" }
  let(:color_two) { "r" }
  
  context "#color" do
    # before { player.color = "r" }
    it "returns color of the player" do
      expect(player_two.color).to eq "r"
    end
  end
  
  context "#switch" do
    it "switches current player to other player" do
      allow(:player_one).to receive(:switch).and_return(:player_two)
      expect(player_one.switch).to eq player_two
    end
  end
end

