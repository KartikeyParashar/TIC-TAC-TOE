echo "------------------------------------------------Welcome to TIC-TAC-TOE Game-------------------------------------------------------------"

declare -A board

check=$((RANDOM%2))

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

function assignment_of_value()
{
	if [ $check -eq 1 ]
	then
		player="X"
		computer="0"
	else
		player="0"
		computer="X"
	fi
}

display_board
assignment_of_value

