/**
 * @file hw7.c
 * @author Andrew Friedman
 * @brief structs, pointers, pointer arithmetic, arrays, strings, and macros
 * @date 11/03/2021
 */

// DO NOT MODIFY THE INCLUDE(S) LIST
#include <stdio.h>

#include "hw7.h"

#include "my_string.h"

// Global array of pokemon structs
struct pokemon pokedex[MAX_POKEDEX_SIZE];

int size = 0;

/** catchPokemon
 *
 * @brief creates a new pokemon struct and adds it to the array of pokemon structs, "pokedex"
 *
 *
 * @param "nickname" nickname of the pokemon being created and added
 *               NOTE: if the length of the nickname (including the null terminating character)
 *               is above MAX_NICKNAME_SIZE, truncate nickname to MAX_NICKNAME_SIZE. If the length
 *               is below MIN_NICKNAME_SIZE, return FAILURE.
 *
 * @param "pokedexNumber" pokedexNumber of the pokemon being created and added
 * @param "powerLevel" power level of the pokemon being created and added
 * @param "speciesName" species name of the pokemon being created and added
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) "nickname" is less than MIN_NICKNAME_SIZE
 *         (2) a pokemon with the same already exits in the array "pokedex"
 *         (3) adding the new pokemon would cause the size of the array "pokedex" to
 *             exceed MAX_POKEDEX_SIZE
 */
int catchPokemon(const char * nickname, int pokedexNumber, double powerLevel, const char * speciesName) {
    long unsigned int nickL = my_strlen(nickname);
    if (nickL < MIN_NICKNAME_SIZE) {
        return FAILURE;
    }
    if (nickL > MAX_NICKNAME_SIZE) {
        nickL = MAX_NICKNAME_SIZE - 1;
    }

    if (my_strlen(speciesName) < MIN_SPECIESNAME_SIZE) {
        return FAILURE;
    }

    int i = 0;
    if (size >= MAX_POKEDEX_SIZE) {
        return FAILURE;
    } else {
        for (; i < size; i++) {
            if (my_strlen(pokedex[i].nickname) == nickL
                && my_strncmp(pokedex[i].nickname, nickname, nickL) == 0) {
                return FAILURE;
            }
        }
        my_strncpy(pokedex[size].nickname, nickname, MAX_NICKNAME_SIZE - 1);
        pokedex[size].pokedexNumber = pokedexNumber;
        pokedex[size].powerLevel = powerLevel;
        my_strncpy(pokedex[size++].speciesName, speciesName, MAX_SPECIESNAME_SIZE - 1);
    }
    return SUCCESS;
}

/** updatePokemonNickname
 *
 * @brief updates the nickname of an existing pokemon in the array of pokemon structs, "pokedex"
 *
 * @param "s" pokemon struct that exists in the array "pokedex"
 * @param "nickname" new nickname of pokemon "s"
 *               NOTE: if the length of nickname (including the null terminating character)
 *               is above MAX_NICKNAME_SIZE, truncate nickname to MAX_NICKNAME_SIZE
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) the pokemon struct "s" can not be found in the array "pokedex"
 */
int updatePokemonNickname(struct pokemon s, const char * nickname) {
    long unsigned int nickL = my_strlen(nickname);
    if (nickL < MIN_NICKNAME_SIZE) {
        return FAILURE;
    }
    if (nickL > MAX_NICKNAME_SIZE) {
        nickL = MAX_NICKNAME_SIZE - 1;
    }
    for (int i = 0; i < size; i++) {
        if (my_strncmp(pokedex[i].nickname, s.nickname, my_strlen(s.nickname)) == 0) {
            my_strncpy(pokedex[i].nickname, nickname, MAX_NICKNAME_SIZE - 1);
            return SUCCESS;
        }
    }
    return FAILURE;
}

/** swapPokemon
 *
 * @brief swaps the position of two pokemon structs in the array of pokemon structs, "pokedex"
 *
 * @param "index1" index of the first pokemon struct in the array "pokedex"
 * @param "index2" index of the second pokemon struct in the array "pokedex"
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) "index1" and/or "index2" are negative numbers
 *         (2) "index1" and/or "index2" are out of bounds of the array "pokedex"
 */
int swapPokemon(int index1, int index2) {
    if (index1 >= size || index2 >= size || index1 < 0 || index2 < 0) {
        return FAILURE;
    }
    struct pokemon temp = pokedex[index1];
    pokedex[index1] = pokedex[index2];
    pokedex[index2] = temp;
    return SUCCESS;
}

/** releasePokemon
 *
 * @brief removes pokemon in the array of pokemon structs, "pokedex", that has the same nickname
 *
 * @param "s" pokemon struct that exists in the array "pokedex"
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) the pokemon struct "s" can not be found in the array "pokedex"
 */
int releasePokemon(struct pokemon s) {
    for (int i = 0; i < size; i++) {
        if (my_strlen(pokedex[i].nickname) == my_strlen(s.nickname)
            && my_strncmp(pokedex[i].nickname, s.nickname, my_strlen(s.nickname)) == 0) {
            for (; i < size; i++) {
                pokedex[i] = pokedex[i + 1];
            }
            size--;
            return SUCCESS;
        }
    }
    return FAILURE;
}

/** comparePokemon
 *
 * @brief compares the two pokemons' pokedex number and names (using ASCII)
 *
 * @param "s1" pokemon struct that exists in the array "pokedex"
 * @param "s2" pokemon struct that exists in the array "pokedex"
 * @return negative number if s1 is less than s2, positive number if s1 is greater
 *         than s2, and 0 if s1 is equal to s2
 */
int comparePokemon(struct pokemon s1, struct pokemon s2) {
    if (s1.pokedexNumber == s2.pokedexNumber) {
        long unsigned int bigNick = my_strlen(s1.nickname);
        if (bigNick < my_strlen(s2.nickname)) {
            bigNick = my_strlen(s2.nickname);
        }
        return my_strncmp(s1.nickname, s2.nickname, bigNick);
    }
    return s1.pokedexNumber - s2.pokedexNumber;
}

/** sortPokemon
 *
 * @brief using the comparePokemon function, sort the pokemons in the array of
 * pokemon structs, "pokedex," by the pokedex number and nicknames
 *
 * @param void
 * @return void
 */
void sortPokemon(void) {
    for (int i = 0; i < size; i++) {
        for (int j = 1 + i; j < size; j++) {
            if (comparePokemon(pokedex[i], pokedex[j]) > 0) {
                swapPokemon(i, j);
            }
        }
    }
}
