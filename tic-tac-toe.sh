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
	block=0
	for (( num=1; num<=3; num++ ))
	do
		for (( j=1; j<=3; j++ ))
		do
#........Horizontal...........................................................................................................................
			if [[ ${board[$num,$j]} == "-" && ${board[$num,$(( $j + 1 ))]} == $computer && {board[$num,$(( $j + 2 ))]} == $computer ]]
			then
				board[$num,$j]=$computer
				block=1
			elif [[ ${board[$num,$j]} == $computer && ${board[$num,$(( $j + 1 ))]} == "-" && {board[$num,$(( $j + 2 ))]} == $computer ]]
			then
				board[$num,$(( $j + 1 ))]=$computer
				block=1
			elif [[ ${board[$num,$j]} == $computer && ${board[$num,$(( $j + 1 ))]} == $computer && {board[$num,$(( $j + 2 ))]} == "-" ]]
			then
				board[$num,$(( $j + 2 ))]=$computer
				block=1
			fi
#.......Vertical..............................................................................................................................
			if [[ ${board[$j,$num]} == "-" && ${board[$(( $j + 1 )),$num]} == $computer && ${board[$(( $j + 2 )),$num]} == $computer ]]
			then
				board[$j,$num]=$computer
				block=1
			elif [[ ${board[$j,$num]} == $computer && ${board[$(( $j + 1 )),$num]} == "-" && ${board[$(( $j + 2 )),$num]} == $computer ]]
			then
				board[$(( $j + 1 )),$num]=$computer
				block=1
			elif [[ ${board[$j,$num]} == $computer && ${board[$(( $j + 1 )),$num]} == $computer && ${board[$(( $j + 2 )),$num]} == "-" ]]
			then
				board[$(( $j + 2 )),$num]=$computer
				block=1
			fi
#........Diagonal1.............................................................................................................................
			if [[ ${board[$num,$j]} == "-" && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $num + 2 )),$(( $j + 2 ))]} == $computer ]]
			then
				board[$num,$j]=$computer
				block=1
			elif [[ ${board[$num,$j]} == $computer && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == "-" && ${board[$(( $num + 2 )),$(( $j + 2 ))]} == $computer ]]
			then
				board[$(( $num + 1 )),$(( $j + 1 ))]}=$computer
				block=1
			elif [[ ${board[$num,$j]} == $computer && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $num + 2 )),$(( $j + 2 ))]} == "-" ]]
			then
				board[$(( $num + 2 )),$(( $j + 2 ))]=$computer
				block=1
			fi
#........Diagonal2.............................................................................................................................
			if [[ ${board[$num,$(( $j + 2 ))]} == "-" && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $num + 2 )),$j]} == $computer ]]
			then
				board[$num,$j]=$computer
				block=1
			elif [[ ${board[$num,$(( $j + 2 ))]} == $computer && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == "-" && ${board[$(( $num + 2 )),$j]} == $computer ]]
			then
				board[$(( $num + 1 )),$(( $j + 1 ))]=$computer
				block=1
			elif [[ ${board[$num,$(( $j + 2 ))]} == $computer && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $computer && ${board[$(( $num + 2 )),$j]} == "-" ]]
			then
				board[$num,$j]=$computer
				block=1
			fi
		done
	done
	if [ $block -eq 1 ]
	then
		display_board
		checkWin
	fi
}


function computer_block_check()
{
	for (( num=1; num<=3; num++ ))
	do
		for (( j=1; j<=3; j++ ))
		do
#........Horizontal...........................................................................................................................
			if [[ ${board[$num,$j]} == "-" && ${board[$num,$(( $j + 1 ))]} == $player && {board[$num,$(( $j + 2 ))]} == $player ]]
			then
				board[$num,$j]=$computer
				block=1
			elif [[ ${board[$num,$j]} == $player && ${board[$num,$(( $j + 1 ))]} == "-" && {board[$num,$(( $j + 2 ))]} == $player ]]
			then
				board[$num,$(( $j + 1 ))]=$computer
				block=1
			elif [[ ${board[$num,$j]} == $player && ${board[$num,$(( $j + 1 ))]} == $player && {board[$num,$(( $j + 2 ))]} == "-" ]]
			then
				board[$num,$(( $j + 2 ))]=$computer
				block=1
			fi
#.......Vertical..............................................................................................................................
			if [[ ${board[$j,$num]} == "-" && ${board[$(( $j + 1 )),$num]} == $player && ${board[$(( $j + 2 )),$num]} == $player ]]
			then
				board[$j,$num]=$computer
				block=1
			elif [[ ${board[$j,$num]} == $player && ${board[$(( $j + 1 )),$num]} == "-" && ${board[$(( $j + 2 )),$num]} == $player ]]
			then
				board[$(( $j + 1 )),$num]=$computer
				block=1
			elif [[ ${board[$j,$num]} == $player && ${board[$(( $j + 1 )),$num]} == $player && ${board[$(( $j + 2 )),$num]} == "-" ]]
			then
				board[$(( $j + 2 )),$num]=$computer
				block=1
			fi
#........Diagonal1.............................................................................................................................
			if [[ ${board[$num,$j]} == "-" && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $player && ${board[$(( $num + 2 )),$(( $j + 2 ))]} == $player ]]
			then
				board[$num,$j]=$computer
				block=1
			elif [[ ${board[$num,$j]} == $player && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == "-" && ${board[$(( $num + 2 )),$(( $j + 2 ))]} == $player ]]
			then
				board[$(( $num + 1 )),$(( $j + 1 ))]}=$computer
				block=1
			elif [[ ${board[$num,$j]} == $player && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $player && ${board[$(( $num + 2 )),$(( $j + 2 ))]} == "-" ]]
			then
				board[$(( $num + 2 )),$(( $j + 2 ))]=$computer
				block=1
			fi
#........Diagonal2.............................................................................................................................
			if [[ ${board[$num,$(( $j + 2 ))]} == "-" && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $player && ${board[$(( $num + 2 )),$j]} == $player ]]
			then
				board[$num,$j]=$computer
				block=1
			elif [[ ${board[$num,$(( $j + 2 ))]} == $player && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == "-" && ${board[$(( $num + 2 )),$j]} == $player ]]
			then
				board[$(( $num + 1 )),$(( $j + 1 ))]=$computer
				block=1
			elif [[ ${board[$num,$(( $j + 2 ))]} == $player && ${board[$(( $num + 1 )),$(( $j + 1 ))]} == $player && ${board[$(( $num + 2 )),$j]} == "-" ]]
			then
				board[$num,$j]=$computer
				block=1
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
		checkWin

	else
		echo "Position Occupied or Invalid Position for user"
		tie_game
		player_turn
	fi
	((movecount++))
	display_board
	echo "@ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $ @ $"
	tie_game
	computer_turn
}

function computer_turn()
{
	echo "--------------------------------------------------------COMPUTER TURN-----------------------------------------------------------------"
	checkWin
	computer_win_check
	if [ $block -eq 0 ]
	then
		computer_block_check
		check_corners
	fi
	if [ $block -eq 0 ]
	then
		row=$(( ( RANDOM % 3 ) + 1 ))
		column=$(( ( RANDOM % 3 ) + 1 ))
			if [[ ${board[$row,$column]} == "-" ]]
			then
				board[$row,$column]=$computer
			else
				echo "Position Occupied"
				computer_turn
			fi
	fi
	((movecount++))
	display_board
	checkWin
	tie_game
	player_turn
}

function check_corners()
{
	block=0
	for (( num=1; num<=3; num=$(( $num + 2 )) ))
	do
		for (( num_in=1; num_in<=3; num_in=$(( $num_in + 2 )) ))
		do
			if [[ ${board[$num,$num_in]} == "-" ]]
			then
				board[$num,$num_in]=$computer
				block=1
				return
			fi
		done
	done
}

assign_symbol
reset_board

while [[ $movecount -ne $TOTALCOUNT ]]
do
	computer_turn
done
