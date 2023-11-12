mkcd(){
	mkdir $1
	cd $1
}

cd(){
    builtin cd "$@"
    if [[ -d ./.venv ]]
    then
        . ./.venv/bin/activate
    fi
}
