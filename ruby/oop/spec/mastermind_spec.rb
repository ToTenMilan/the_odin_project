require 'game'
require 'board'
require 'code_pegs_row'
require 'key_pegs_row'
require 'input_error'

describe Board do
  
  before do
  # subject do
    @board = Board.new
    @board.slots = Array.new(12, Array.new(4, " "))
    @board.goal = Array.new(4, " ")
    @board.check_slots = Array.new(12, Array.new(4, " "))
    @all_colors = ["R", "A", "G", "Y", "B", "W", "M", "O"]
  end
  
  describe "initialize with attributes" do
    context "#new" do
      it "returns board with attributes set" do
        expect(@board.slots).to eq Array.new(12, Array.new(4, " "))
        expect(@board.goal).to eq Array.new(4, " ")
        expect(@board.check_slots).to eq Array.new(12, Array.new(4, " "))
        expect(@all_colors).to eq ["R", "A", "G", "Y", "B", "W", "M", "O"]
      end
    end
  end
  
  context "#set_goal" do
    check_array = %w{R R R R R R R R}
    it "returns goal set with multiple colors in row possible" do
      expect(@board.set_goal(check_array)).to eq %w{R R R R}
    end
    
  end
  
  let(:goal) do
    @board.goal = %w{g r a m} # green red azure magenta
  end
  
  context "#show" do
    it { is_expected.to respond_to(:show) }
  end
  
  context "#fill_guess_slots" do
    input = ["b", "m", "y", "w"]
    counter = 0
    it "fills next slots with user input" do
      expect(@board.fill_guess_slots(input, counter)).to eq input
    end
  end
  
  context "#fill_check_slots" do
    check_pegs = ["O", " ", " ", " "]
    counter = 0
    it "returns check slots filled with small_pegs" do
      expect(@board.fill_check_slots(check_pegs, counter)).to eq check_pegs
    end
  end
    
end





# describe Game do
#   before(:example) do
#     @game = Game.new
#     @game.play
#   end
  # describe Game.new do
  #   it {is_expected.to have_attributes() }
  # end
# end

# describe Game do
  
  # context "#new" do
  #   it "should initialize game attributes" do
  #     game = double('game')
  #     allow(game).to receive(:board) 
  #     expect(game.board).to be_instance_of('game')
  #   end
  # end
# end

