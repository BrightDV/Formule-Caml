# Formule Caml version simplifiée

## Principe du jeu
- Le plateau est consituté du tracé d'un circuit.
- A chaque tour, le joueur tire un chiffre au dé. Il peut se déplacer uniquement en ligne, en colonne ou en diagonale.
- Le but est d'aller du point `D` (départ) au point `A` (arrivée) avant l'autre joueur.

## Règles du jeu
- Au début du tour, le joueur précise s'il souhaite changer de vitesse. Il doit répondre par `o` (oui) ou `n` (non).
  - S'il souhaite changer de vitesse, il doit alors préciser s'il veut monter (`m`) ou descendre (`d`) la vitesse. Le nombre de cases tirée par le "dé" dépend de la vitesse:
    - 1e: une case
    - 2e: 2 à 6 cases
    - 3e: 6 à 12 cases
    - 4e: 12 à 24 cases (seulement disponible lorsque la durabilité de la voiture est strictement supérieure à 20/100)
  - Sinon, il conserve la même vitesse.
- Le joueur est ensuite invité à indiquer la direction du déplacement:
  - `h` pour le haut
  - `b` pour le bas
  - `g` pour la gauche
  - `d` pour la droite
  - `dhg` pour la diagonale gauche vers le haut
  - `dhd` pour la diagonale droite vers le haut
  - `dbg` pour la diagonale gauche vers le bas
  - `dbd` pour la diagonale droite vers le bas

## Propriétés des véhicules
- Vitesse: elle influe sur le nombre de cases tiré par le dé.
- Durabilité: si elle est inférieure ou égale à 0, le joueur est obligé d'abandonner. Si elle est inférieure ou égale à 20, le joueur ne peut plus passer en 4e.

## Plateau
- Les cases où les **déplacements sont possibles** sont uniquement les cases `-` ou la case `D`.
- Les cases `0` indiquent l'extérieur de la piste.
- Les cases `_`, `/`, `\`, `‾` indiquent les bordures de la piste. Il n'est pas possible d'y aller.
- La case `A` est uniquement atteignable en venant de la droite.
- La case `X` est la position du joueur 1
- La case `Y` est la position du joueur 2

## Evènements
- Si un joueur touche la bordure de la piste, il perd 20 points de durabilité.
- Si un joueur rentre dans l'autre joueur:
  - Le joueur qui a causé l'accident perd 10 points de durabilité.
  - Le joueur qui a subit l'accident perd 15 points de durabilité.
- Lorsque un joueur arrive à la case `A`, il gagne la course et c'est la fin du jeu.