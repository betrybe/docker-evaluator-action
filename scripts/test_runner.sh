
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

RESULTS_FILE=$(echo $(pwd)/../evaluation_result.txt)
touch $RESULTS_FILE
> $RESULTS_FILE

run_docker_command() {
  dockerCommand="$(cat $1) $(cat $2)"
  printf "\nExecutando comando: $(cat $1)\n"
  result=$(eval $dockerCommand)
  printf "\nResultado esperado: $(cat $3)\n"
  printf "\nResultado obtido: $result\n"
  if [ $result == "$(cat $3)" ]; then
    printf "\n${GREEN}PASS${NC}\n"
  else
    printf "\n${RED}NOT PASS${NC}\n"
  fi
}

for entry in "$(pwd)/../expected-results/"/*
do
  challengeFileName=$(echo "$(basename $entry .dcr)")
  printf "\n======================== $challengeFileName ========================\n" >> $RESULTS_FILE
  run_docker_command "$(pwd)/../challenges/$challengeFileName.dc" "$(pwd)/../challenges-params/$challengeFileName.dcp" "$(pwd)/../expected-results/$challengeFileName.dcr" >> $RESULTS_FILE
  printf "\n====================== $challengeFileName-end ======================\n" >> $RESULTS_FILE
done

cat $RESULTS_FILE
