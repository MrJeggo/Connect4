class Connect4
  attr_accessor :player_1_turn
  def initialize
    @board = Array.new(6) {Array.new(7) {' '}}

    @player_1_turn = true
  end

  def change_player
    @player_1_turn = !@player_1_turn
  end

  def place_piece(column, piece)
    if column < 1 || column > 7
      puts "Choose a number from 1 to 7"
      return false
    end

    column -= 1
    row = 0

    if @board[row][column] != ' '
      puts "Full row"
      return false
    end

    until @board[row+1].nil? || @board[row+1][column] != ' '
      row += 1
    end
    @board[row][column] = piece
    true
  end

  def display_board
    output = " 1 2 3 4 5 6 7\n"
    @board.each {|row| output << "|" << row.join('|') << "|\n"}
    output
  end


end

c = Connect4.new
c.place_piece(1,'X')
c.place_piece(1,'X')
# c.place_piece(1,'X')
# c.place_piece(1,'X')
# puts c.display_board
