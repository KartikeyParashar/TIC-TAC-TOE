echo "------------------------------------------------Welcome to TIC-TAC-TOE Game-------------------------------------------------------------"

declare -A board

function display_board()
{
	for(( num=1; num<=3;  num++ ))
	do
		for(( num_in=1; num_in<=3; num_in++ ))
		do
			board[$num,$num_in]=""
		done
	done
}

display_board
