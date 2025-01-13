#!/bin/bash
PSQL="psql -X --username=newuser --dbname=test --no-align --tuples-only -c"; 

#checa se há resposta
if [[ $1 ]]
#se tem resposta
  then
  #checar se é numero
  if [[ ! $1 =~ ^[0-9]+$ ]]
  #se for palavras
  then
  #procurar pelo nome num full join
  ELEMENT=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties JOIN elements USING (atomic_number) JOIN types USING (type_id) WHERE elements.name LIKE '$1%' ORDER BY atomic_number LIMIT 1")
  #se for número
  else
  #procura pelo atomic number num full join
  ELEMENT=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties JOIN elements USING (atomic_number) JOIN types USING (type_id) WHERE elements.atomic_number = $1")
  fi
  #se NÃO encontrou resultados nas procuras
  if [[ -z $ELEMENT ]]
    then
    echo "I could not find that element in the database."
    #se encontrou
    else
    echo $ELEMENT | while IFS=\| read ATOMIC_NUMBER ATOMIC_MASS MPC BPC SYMBOL NAME TYPE
    do
    #printa a frase com as variáveis
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    done
    fi
#se não tem resposta
else
echo  "Please provide an element as an argument." 
fi