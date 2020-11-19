class TicTacToe
    attr_accessor :winner
    attr_reader :board
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end 

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
      end
      
    def input_to_index(input)
        input.to_i - 1 
    end 

    def move(index, token = "X")
        @board[index] = token 
    end 

    def position_taken?(index)
        if @board[index].include?("X") || @board[index].include?("O")
             true 
        else 
            false 
        end 
    end 

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end 
        
    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end 

    def current_player 
       turn_count % 2 == 0 ? "X" : "O"
    end 

    def turn 
        puts "Please enter a number 1-9:"
        input = gets.strip
        index = input_to_index(input)
        player = current_player
        if valid_move?(index) 
            move(index, player)
            display_board
        else 
            turn 
        end 
    end 

    def won? 
        x_won = WIN_COMBINATIONS.find do |index|
            @board[index[0]] == "X" && @board[index[1]] == "X" && @board[index[2]] == "X"
        end 
        o_won = WIN_COMBINATIONS.find do |index|
            @board[index[0]] == "O" && @board[index[1]] == "O" && @board[index[2]] == "O"
        end 
        x_won || o_won
    end 

    def full? 
        !@board.any?{|index| index == " " } 
    end 

    def draw?
       if full? && !won? 
        true 
       elsif won? || !full?
        false 
       else 
       end 
    end 

    def over?
        if draw? || won?
            true 
        else 
            false 
        end 
    end 

    def winner
        if won? 
            @board[won?[0]] == "X" ?
            "X" : "O"
        else 
            nil
        end 
    end 

    def play 
        while !over?
            turn
        end 
        if won? 
            @winner = winner 
            puts "Congratulations #{@winner}!"
        elsif draw? 
            puts "Cat's Game!"
        end 
    end 
end 