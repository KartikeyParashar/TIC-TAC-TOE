echo "------------------------------------------------Welcome to TIC-TAC-TOE Game-------------------------------------------------------------"

declare -A board

check=$((RANDOM%2))

TOTALCOUNT=9

movecount=1


function reset_board()
{
	for(( num=1; num<=3; num++ ))
	do
		for(( num_in=1; num_in<=3; num_in++ ))
		do
			board[$num,$num_in]="-"
		done
	done
}

function assign_symbol()
{
	#player=1
	#computer=0
	if [ $check -eq 1 ]
	then
		player="X"
		computer="0"
	else
		player="0"
		computer="X"
	fi
	echo "Player has --> $player value assigned"
	echo "Computer has --> $computer value assigned"
}

function toss()
{
	#player=1
	#computer=0
	if [ $check -eq 1 ]
	then
		echo "Player has won the toss"
	else
		echo "Computer has won the toss"
	fi
}

function display_board()
{

	for (( num=1; num<=3; num++ ))
	do
		for (( num_in=1; num_in<=3; num_in++ ))
		do
			echo -n "| ${board[$num,$num_in]} "
		done
		echo "|"
		echo "______________"
	done
}


function checkEmptyCell()
{
	read -p "Enter row: " row
	read -p "Enter column: " column

	if [ ${board[$row,$column]} == "-" ]
	then
		board[$row,$column]=$player
		((movecount++))
		display_board
	else
		echo "Position Occupied or Invalid Position"
	fi
}

function checkWin()
{
	for (( num=1; num<=3; num++ ))
	do
		for (( num_in=1; num_in<=3; num_in++ ))
		do
			checkHorizontal=${board[$num,$num_in]}${board[$num,$(( $num_in + 1 ))]}${board[$num,$(( $num_in + 2 ))]}
			if [[ $checkHorizontal == "$player$player$player" ]]
			then
				echo "YOU WON"
				exit
			elif [[ $checkHorizontal == "$computer$computer$computer" ]]
			then
			 	echo "COMPUTER WON"
				exit
			fi

			checkVertical=${board[$num_in,$num]}${board[$(( $num_in + 1 )),$num]}${board[$(( $num_in + 2 )),$num]}
			if [[ $checkVertical == "$player$player$player" ]]
			then
				echo "YOU WON"
				exit
			elif [[ $checkVertical == "$computer$computer$computer" ]]
			then
				echo "COMPUTER WON"
				exit
			fi

			checkDiagonal1=${board[$num,$num_in]}${board[$(( $num + 1 )),$(( $num_in + 1 ))]}${board[$(( $num + 2 )),$(( $num_in + 2 ))]}
			checkDiagonal2=${board[$num,$(( $num_in + 2 ))]}${board[$(( $num + 1 )),$(( $num_in + 1 ))]}${board[$(( $num + 2 )),$num_in]}

			if [[ $checkDiagonal1 == "$player$player$player" ]]
			then
				echo "YOU WIN"
				exit
			elif [[ $checkDiagonal1 == "$computer$computer$computer" ]]
			then
				echo "COMPUTER WIN"
				exit
			fi

			if  [[ $checkDiagonal2 == "$player$player$player" ]]
			then
				echo "YOU WIN"
				exit
			elif [[ $checkDiagonal2 == "$computer$computer$computer" ]]
			then
				echo "COMPUTER WIN"
				exit
			fi
		done
	done
}

function computer_win_check()
{
	for (( num=1; num<=3; num++ ))
	do
		for (( num_in=1; num_in<=3; num_in++ ))
		do
#........Horizontal...........................................................................................................................
			if [[ ${board[$i,$j]} == "-" && ${board[$i,$(( $j + 1 ))]} == $computer && {board[$i,$(( $j + 2 ))]} == $computer ]]
			then
				board[$i,$j]=$computer
			elif [[ ${board[$i,$j]} == $computer && ${board[$i,$(( $j + 1 ))]} == "-" && {board[$i,$(( $j + 2 ))]} == $computer ]]
			then
				board[$i,$(( $j + 1 ))]=$computer
			elif [[ ${board[$i,$j]} == $computer && ${board[$i,$(( $j + 1 ))]} == $computer && {board[$i,$(( $j + 2 ))]} == "-" ]]
			then
				board[$i,$(( $j + 2 ))]=$computer
			fi
#.......Vertical..............................................................................................................................
			if [[ ${board[$j,$i]} == "-" && ${board[$(( $j + 1 )),$i]} == $computer && ${board[$(( $j + 2 )),$i]} == $computer ]]
			then
				board[$j,$i]=$computer
			elif [[ ${board[$j,$i]} == $computer && ${board[$(( $j + 1 )),$i]} == "-" && ${board[$(( $j + 2 )),$i]} == $computer ]]
			then
				board[$(( $j + 1 )),$i]=$computer
			elif [[ ${board[$j,$i]} == $computer && ${board[$(( $j + 1 )),$i]} == $computer && ${board[$(( $j + 2 )),$i]} == "-" ]]
			then
				board[$(( $j + 2 )),$i]=$computer
			fi
#........Diagonal1.............................................................................................................................
			if [[ ${board[$i,$j]} == "-" && ${board[$(( $i + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $i + 2 )),$(( $j + 2 ))]} == $computer ]]
			then
				board[$i,$j]=$computer
			elif [[ ${board[$i,$j]} == $computer && ${board[$(( $i + 1 )),$(( $j + 1 ))]} == "-" && ${board[$(( $i + 2 )),$(( $j + 2 ))]} == $computer ]]
			then
				board[$(( $i + 1 )),$(( $j + 1 ))]}=$computer
			elif [[ ${board[$i,$j]} == $computer && ${board[$(( $i + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $i + 2 )),$(( $j + 2 ))]} == "-" ]]
			then
				board[$(( $i + 2 )),$(( $j + 2 ))]=$computer
			fi
#........Diagonal2.............................................................................................................................
			if [[ ${board[$i,$(( $j + 2 ))]} == "-" && ${board[$(( $i + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $i + 2 )),$j]} == $computer ]]
			then
				board[$i,$j]=$computer
			elif [[ ${board[$i,$(( $j + 2 ))]} == $computer && ${board[$(( $i + 1 )),$(( $j + 1 ))]} == "-" && ${board[$(( $i + 2 )),$j]} == $computer ]]
			then
				board[$(( $i + 1 )),$(( $j + 1 ))]=$computer
			elif [[ ${board[$i,$(( $j + 2 ))]} == $computer && ${board[$(( $i + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $i + 2 )),$j]} == "-" ]]
			then
				board[$i,$j]=$computer
			fi
		done
	done
}

function tie_game()
{
	if [[ $movecount -eq $TOTALCOUNT ]]
	then
		echo "MATCH TIE!!!"
		exit
	fi
}

function player_turn()
{
	echo "-------------------------------------------------------PLAYER TURN--------------------------------------------------------------------"
	read -p "Enter row: " row
	read -p "Enter column: " column
	if [[ ${board[$row,$column]} == "-" ]]
	then
		board[$row,$column]=$player
		((movecount++))
		display_board
		echo "@ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $"
		checkWin
		computer_turn
	else
		echo "Position Occupied or Invalid Position for user"
		tie_game
		player_turn
	fi
}

function computer_turn()
{
	echo "--------------------------------------------------------COMPUTER TURN-----------------------------------------------------------------"
	row=$(( ( RANDOM % 3 ) + 1 ))
	column=$(( ( RANDOM % 3 ) + 1 ))
		if [[ ${board[$row,$column]} == "-" ]]
		then
			board[$row,$column]=$computer
			((movecount++))
			display_board
			checkWin
			computer_win_check
			
			player_turn
		else
			echo "Position Occupied"
			tie_game
			computer_turn
		fi
}

assign_symbol
reset_board

while [[ $movecount -ne $TOTALCOUNT ]]
do
	computer_turn
done
