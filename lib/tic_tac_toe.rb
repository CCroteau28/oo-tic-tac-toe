require "pry"

class TicTacToe
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    def initialize 
        @board = Array.new(9," ")
    end

    def display_board
         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
         puts "-----------"
         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
         puts "-----------"
         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(arg)
        arg.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        else 
            return true
        end
    end

    def valid_move?(index)
        if !position_taken?(index) && (0..8).include?(index)
            return true
        end
    end

    def turn_count
        @board.count {|token| token == "X" || token == "O" }
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Specify a position between 1-9: "
        user_input = gets.strip
        index_num = input_to_index(user_input)
        if valid_move?(index_num)
            move(index_num, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
                return win_combo
            elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
                return win_combo
            end
        end
    end

    def full?
        @board.all? do |position|
            if position == " "
                false
            else
                true
            end
        end
    end

    def draw?
        if !won? && full?
          true
        else
          false
        end
    end

    def over?
        if won? || draw?
            return true
        else
            return false
        end
    end

    def winner
        WIN_COMBINATIONS.detect do |win_combo|
            if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
                return "X"
            elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
                return "O"
            end
        end
        nil
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end