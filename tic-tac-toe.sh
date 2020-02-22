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
	else
		player="0"
		computer="X"
	fi
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
	echo "-------------------------------------------------------------------------------------------------------------------------------------"
	for (( num=1; num<=3; num++ ))
	do
		for (( num_in=1; num_in<=3; num_in++ ))
		do
			echo -n "| ${board[$num,$num_in]} "
		done
		echo "|"
		echo "--------------"
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
				echo $checkHorizontal
				echo "YOU WON"
				exit
			fi

			checkVertical=${board[$num_in,$num]}${board[$(( $num_in + 1 )),$num]}${board[$(( $num_in + 2 )),$num]}
			if [[ $checkVertical == "$player$player$player" ]]
			then
				echo "YOU WIN"
				exit
			fi

			checkDiagonal1=${board[$num,$num_in]}${board[$(( $num + 1 )),$(( $num_in + 1 ))]}${board[$(( $num + 2 )),$(( $num_in + 2 ))]}
			checkDiagonal2=${board[$num,$(( $num_in + 2 ))]}${board[$(( $num + 1 )),$(( $num_in + 1 ))]}${board[$(( $num + 2 )),$num_in]}
			if [[ $checkDiagonal1 == "$player$player$player" ]]
			then
				echo "YOU WIN"
				exit
			fi

			if  [[ $checkDiagonal2 == "$player$player$player" ]]
			then 
				echo "YOU WIN"
				exit
			fi
		done
	done
}


assign_symbol
reset_board

while [ $movecount -le $TOTALCOUNT ]
do
		checkEmptyCell
		checkWin
done
