require "./lib/connect4"

describe Connect4 do
  describe "does it exist" do
    it "tells if there is a connect 4 module" do
      connect_4 = Connect4.new
      expect(connect_4.class).not_to eq nil
    end
  end

  describe "#change_player" do
    connect_4 = Connect4.new
    it "tells if it is player 1's turn at the beggining of the game" do
      expect(connect_4.player_1_turn).to eql(true)
    end

    it "changes after one player turn" do
      connect_4.change_player
      expect(connect_4.player_1_turn).to eql(false)
    end

    it "changes back after two player turns" do
      connect_4.change_player
      expect(connect_4.player_1_turn).to eql(true)
    end
  end

  describe "#display_board" do
    it "shows the board" do
      connect_4 = Connect4.new
      board = " 1 2 3 4 5 6 7
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
"
      expect(connect_4.display_board).to eql(board)
    end
  end

  describe "#place_piece" do
    connect_4 = Connect4.new

    it "shows false if a piece can't be placed" do
      expect(connect_4.place_piece(0, 'X')).to eql(false)
      expect(connect_4.place_piece(8, 'X')).to eql(false)
    end

    it "returns true if a piece has been added" do
      expect(connect_4.place_piece(1, 'X')).to eql(true)
      expect(connect_4.place_piece(7, 'X')).to eql(true)
    end

    it "places pieces on top the board" do
      board = " 1 2 3 4 5 6 7
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
|X| | | | | |X|
"
      expect(connect_4.display_board).to eql(board)
    end

    it "places pieces on top of each other" do
      board = " 1 2 3 4 5 6 7
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
|X| | | | | | |
|X| | | | | |X|
"
      connect_4.place_piece(1, 'X')
      expect(connect_4.display_board).to eql(board)
    end

    it "placs other types of pieces" do
      board = " 1 2 3 4 5 6 7
| | | | | | | |
| | | | | | | |
| | | | | | | |
|O| | | | | | |
|X| | | | | | |
|X| | | | | |X|
"
      connect_4.place_piece(1, 'O')
      expect(connect_4.display_board).to eql(board)
    end

    it "fills a column" do
      board = " 1 2 3 4 5 6 7
|X| | | | | | |
|X| | | | | | |
|X| | | | | | |
|O| | | | | | |
|X| | | | | | |
|X| | | | | |X|
"
      connect_4.place_piece(1, 'X')
      connect_4.place_piece(1, 'X')
      connect_4.place_piece(1, 'X')
      expect(connect_4.display_board).to eql(board)
    end

    it "tests to see if a column is full" do
      expect(connect_4.place_piece(1,'X')).to eql(false)
    end
  end


end
