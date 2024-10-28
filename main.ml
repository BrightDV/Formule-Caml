type deplacement_base = 
  | Gauche
  | Droite
  | Haut
  | Bas
  | DiagonaleHautGauche
  | DiagonaleBasGauche
  | DiagonaleHautDroite
  | DiagonaleBasDroite

type evenement =
  | Sortie
  | Accident
  | Victoire

let circuit = 
[|
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;0;7;7;7;7;7;7;7;7;7;7;7;7;4;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;5;7;7;7;7;7;7;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;4;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;5;7;7;7;7;7;7;7;7;7;7;7;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;4;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;4;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;5;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;5;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;4;1;1;4;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;5;1;1;1;1;1;1;1;1;5;0;0;0;0;0;0;|];
  [|0;0;0;0;0;6;1;1;1;6;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;6;1;1;1;1;1;1;1;1;6;0;0;0;0;0;|];
  [|0;0;0;0;0;6;1;1;1;5;7;7;7;7;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;7;0;0;0;0;0;0;0;0;0;0;0;0;6;1;1;1;1;1;1;7;4;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;5;1;1;1;1;1;1;1;5;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;4;1;1;1;1;1;1;1;1;1;2;3;1;1;1;1;1;1;1;1;1;1;1;1;5;0;0;0;0;0;0;0;0;0;0;0;6;1;1;1;1;7;4;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;8;8;8;8;5;1;1;1;5;0;0;0;0;0;0;0;0;0;0;0;0;0;4;1;1;1;4;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;5;1;1;1;1;5;0;0;0;0;0;0;0;0;0;4;1;1;1;1;4;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;5;1;1;1;5;0;0;0;0;0;0;0;0;0;0;0;4;1;1;1;4;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;5;1;1;1;1;5;7;7;7;7;7;0;0;0;6;1;1;1;4;0;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;5;1;1;1;5;7;7;7;7;7;7;7;7;7;4;1;1;1;4;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;8;5;1;1;1;1;1;1;1;1;5;7;4;1;1;1;4;0;0;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;5;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;4;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;5;1;1;1;1;1;1;1;1;1;1;1;1;4;0;0;0;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;8;8;8;8;8;8;8;8;8;8;8;8;8;8;8;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;8;8;8;8;8;8;8;8;8;8;8;8;0;0;0;0;0;0;0;0;0;0;0;0;0;0;|];
  [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;|];
|]
let taille_plateau = [|15; 81|]
let depart_j1 = [|8; 39 |]
let depart_j2 = [|8; 40 |]

type jeu = {
  positions: int array array; 
  vitesses: int array;
  durabilites: int array;
  plateau: int array array; 
  mutable gagnant: int option;
  }

let vitesses = [|1; 2; 3; 4;|]

(* intervalles pouvant être tirés au hasard *)
let poids_vitesse = [|[|1; 1|]; [|4; 2|]; [|6; 6|]; [|12; 12|];|]

(* citations adaptées *)
let punchlines_accident joueur = let punchlines = [|
    "\nAccélère, accélère joueur " ^ string_of_int ((joueur + 1) mod 2 + 1) ^ " !!!\n";
    "\nJoueur " ^ string_of_int (joueur + 1) ^ ": le succès ne vient pas par accident.\n";
    "\nIl n'y a point d'accidents si malheureux dont les habiles gens ne tirent quelque avantage.\n";
    "\nMa Range !!! Une voiture toute neuve avec toutes les options !!!!\n";
  |]
  in let x = Random.int 4
  in punchlines.(x)

let punchline_sortie joueur = 
  let punchlines = [|
    "\nTu sais pas conduire, joueur " ^ (string_of_int (joueur+1)) ^ "... t'es mauvais !\n";
    "\nJoueur " ^ (string_of_int (joueur+1)) ^ ": la pression c'est pas à subir, c'est pour gonfler les pneus...\n";
    "\nTerrrrrible accident pour le joueur " ^ (string_of_int (joueur+1)) ^ " !!\n";
    "\nD'accord, une voiture c'est fait pour rouler... mais parfois il faut freiner !\n";
    "\nAttention ! Pour terminer premier, il faut premièrement terminer...\n"
  |]
  in let x = Random.int 5
  in punchlines.(x)

(* vérifie si les nouvelles coordonnées sont dans le circuit *)
let verif_limite_base jeu joueur dir nb =
  match dir with
  | Haut -> if jeu.positions.(joueur).(0) - nb >= 0 then true else false
  | Bas -> if jeu.positions.(joueur).(0) + nb < taille_plateau.(0) then true else false
  | Gauche ->if jeu.positions.(joueur).(1) - nb >= 0 then true else false
  | Droite ->if jeu.positions.(joueur).(1) + nb < taille_plateau.(1) then true else false

let verif_limite jeu joueur dir nb = 
  match dir with
  | Haut -> verif_limite_base jeu joueur dir nb
  | Bas -> verif_limite_base jeu joueur dir nb
  | Gauche -> verif_limite_base jeu joueur dir nb
  | Droite -> verif_limite_base jeu joueur dir nb
  | DiagonaleHautGauche -> verif_limite_base jeu joueur Gauche nb && verif_limite_base jeu joueur Haut nb
  | DiagonaleBasGauche -> verif_limite_base jeu joueur Gauche nb && verif_limite_base jeu joueur Bas nb
  | DiagonaleHautDroite -> verif_limite_base jeu joueur Droite nb && verif_limite_base jeu joueur Haut nb
  | DiagonaleBasDroite -> verif_limite_base jeu joueur Droite nb && verif_limite_base jeu joueur Bas nb

(* vérifie si les cases peuvent être parcourues par le déplacement *)
let verif_ligne jeu joueur dir n =
  let rec verif_case joueur dir nb =
    if nb = n + 1 then true, None, (0,0) else begin
      let i,j =
        match dir with
        | Haut -> jeu.positions.(joueur).(0) - nb, jeu.positions.(joueur).(1)
        | Bas -> jeu.positions.(joueur).(0) + nb, jeu.positions.(joueur).(1)
        | Gauche -> jeu.positions.(joueur).(0), jeu.positions.(joueur).(1) - nb
        | Droite -> jeu.positions.(joueur).(0), jeu.positions.(joueur).(1) + nb
        | DiagonaleHautGauche -> jeu.positions.(joueur).(0) - nb, jeu.positions.(joueur).(1) - nb
        | DiagonaleBasGauche -> jeu.positions.(joueur).(0) + nb, jeu.positions.(joueur).(1) - nb
        | DiagonaleHautDroite -> jeu.positions.(joueur).(0) - nb, jeu.positions.(joueur).(1) + nb
        | DiagonaleBasDroite -> jeu.positions.(joueur).(0) + nb, jeu.positions.(joueur).(1) + nb
      in match jeu.plateau.(i).(j) with
        (* condition du déplacement selon le type de case *)
        | _ when jeu.positions.((joueur + 1) mod 2) = [|i; j|]-> false, Some Accident, (i, j)
        | 1 -> verif_case joueur dir (nb+1)
        | 2 -> verif_case joueur dir (nb+1)
        | 3 -> if (dir = Droite) then false, Some Accident, (i, j) else false, Some Victoire , (0, 0)
        | _ -> false, Some Sortie, (i, j)
    end
  in verif_case joueur dir 1

(* déplacement dans les quatre directions *)
let deplacement_elementaire jeu joueur dir nb =
  match dir with
    | Haut -> jeu.positions.(joueur).(0) <- jeu.positions.(joueur).(0) - nb
    | Bas -> jeu.positions.(joueur).(0) <- jeu.positions.(joueur).(0) + nb
    | Gauche -> jeu.positions.(joueur).(1) <- jeu.positions.(joueur).(1) - nb
    | Droite -> jeu.positions.(joueur).(1) <- jeu.positions.(joueur).(1) + nb
  

(* déplacer la position du joueur *)
let rec deplacer jeu joueur dir nb = 
  let dans_plateau = verif_limite jeu joueur dir nb in
  let trajet_possible, pb, (i, j) = verif_ligne jeu joueur dir nb in
  if (dans_plateau && trajet_possible) then begin
    (* déplacement normal du joueur *)
    (match dir with
    | Haut -> deplacement_elementaire jeu joueur dir nb
    | Bas -> deplacement_elementaire jeu joueur dir nb
    | Gauche -> deplacement_elementaire jeu joueur dir nb
    | Droite -> deplacement_elementaire jeu joueur dir nb
    | DiagonaleHautGauche ->  (deplacement_elementaire jeu joueur Gauche nb; deplacement_elementaire jeu joueur Haut nb)
    | DiagonaleBasGauche -> (deplacement_elementaire jeu joueur Gauche nb; deplacement_elementaire jeu joueur Bas nb)
    | DiagonaleHautDroite -> (deplacement_elementaire jeu joueur Droite nb; deplacement_elementaire jeu joueur Haut nb)
    | DiagonaleBasDroite -> (deplacement_elementaire jeu joueur Droite nb; deplacement_elementaire jeu joueur Bas nb));
  end
  else begin
    (* déplace le joueur juste avant l'obstacle *)
    (match dir with
    | Haut -> jeu.positions.(joueur).(0) <- i+1;
    | Bas -> jeu.positions.(joueur).(0) <- i-1;
    | Gauche -> jeu.positions.(joueur).(1) <- j+1;
    | Droite -> jeu.positions.(joueur).(1) <- j-1;
    | DiagonaleHautGauche ->  (jeu.positions.(joueur).(0) <- i+1; jeu.positions.(joueur).(1) <- j+1)
    | DiagonaleBasGauche -> (jeu.positions.(joueur).(0) <- i-1; jeu.positions.(joueur).(1) <- j+1)
    | DiagonaleHautDroite -> (jeu.positions.(joueur).(0) <- i+1; jeu.positions.(joueur).(1) <- j-1)
    | DiagonaleBasDroite -> (jeu.positions.(joueur).(0) <- i-1; jeu.positions.(joueur).(1) <- j-1));
    (* diminuer la durabilité *)
   ( match pb with
    | None -> ()
    | Some Sortie -> jeu.durabilites.(joueur) <- jeu.durabilites.(joueur) - 20
    | Some Accident -> begin 
      jeu.durabilites.(joueur) <- jeu.durabilites.(joueur) - 10; 
      jeu.durabilites.((joueur + 1) mod 2) <- jeu.durabilites.((joueur + 1) mod 2) - 15;
    end;
    | Some Victoire -> jeu.gagnant <- Some joueur);
    (* afficher la punchline si sortie ou accident *)
    match pb with
    | Some Sortie -> print_string (punchline_sortie joueur)
    | Some Accident -> print_string (punchlines_accident joueur)
    | _ -> ()
    
  end

let afficher_circuit type_case = 
  match type_case with
  | 0 -> print_string"0"
  | 1 -> print_string "-"
  | 2 -> print_string "D"
  | 3 -> print_string "A"
  | 4 -> print_string "/"
  | 5 -> print_string "\\"
  | 6 -> print_string "|"
  | 7 -> print_string "_"
  | 8 -> print_string "‾"
  | _ -> print_string "0" (* type de surface inconnu *)

let afficher_stats jeu joueur =
  Printf.printf "######################## Joueur %s ########################\n" (string_of_int (joueur+1));
  Printf.printf "Vitesse actuelle: %se\n" (string_of_int jeu.vitesses.(joueur));
  Printf.printf "Durabilité de la voiture: %s/100\n" (string_of_int jeu.durabilites.(joueur));
  print_string "##########################################################\n\n"

(* afficher le circuit et les joueurs *)
  let afficher jeu joueur = 
  print_newline ();
  let rec afficher_ligne i j lignes colonnes =
    match i with
    | _ when i = lignes -> print_newline ()
    | _ when j = colonnes -> begin
      print_newline ();
      afficher_ligne (i+1) 0 lignes colonnes
    end
    | _ -> match [|i; j|] with
      | [|a;b|] when a=jeu.positions.(0).(0) && b=jeu.positions.(0).(1) -> print_string "X"; afficher_ligne i (j+1) lignes colonnes
      | [|a;b|] when a=jeu.positions.(1).(0) && b=jeu.positions.(1).(1) -> print_string "Y"; afficher_ligne i (j+1) lignes colonnes
      | [|a;b|] -> afficher_circuit jeu.plateau.(i).(j); afficher_ligne i (j+1) lignes colonnes
  in afficher_ligne 0 0 taille_plateau.(0) taille_plateau.(1);
  afficher_stats jeu joueur

let init () = {
  positions = [|depart_j1; depart_j2|]; 
  vitesses = [|1; 1;|];
  durabilites = [|100; 100;|];
  plateau = circuit;
  gagnant = None;
  }

let afficher_depart () =
  print_string "##########################################################\n";
  print_string "##########################################################\n";
  print_string "##############  Bienvenue dans Formule Caml  #############\n";
  print_string "##########################################################\n";
  print_string "##########################################################\n";
  print_newline ();
  print_newline ();
  print_string "Il est conseillé de jouer en plein écran.\n";
  print_newline ();
  print_string "Les règles du jeu sont indiquées dans le fichier README.md\n";
  print_newline ();
  print_newline ()

let afficher_fin_abandon joueur_perdant =
  print_string "\n########################################################\n\n";
  print_string "La course est terminée à cause d'un abandon !\n";
  Printf.printf "C'est le joueur %s qui a perdu !\n\n" (string_of_int (joueur_perdant + 1));
  print_string "##########################################################\n\n"

let afficher_fin_victoire jeu =
  print_string "\n##########################################################\n\n";
  print_string "Victoire !!!!!\n";
  let Some indice_gagnant = jeu.gagnant in
  Printf.printf "C'est le joueur %s qui remport la course ! Bravo !\n\n" (string_of_int (indice_gagnant + 1));
  print_string "##########################################################\n\n"

let changement_vitesse jeu joueur vitesse =
  jeu.vitesses.(joueur) <- jeu.vitesses.(joueur) + vitesse;
  print_string "Vitesse enclenchée !\n"

let changer_vitesse jeu joueur =
  print_string "Monter ou descendre la vitesse ? (m|d) ";
  match read_line () with
  | "m" -> if (jeu.vitesses.(joueur) = 4 || (jeu.vitesses.(joueur) = 3 && jeu.durabilites.(joueur) <= 20)) then print_string "Impossible !\n" else changement_vitesse jeu joueur 1
  | "d" -> if (jeu.vitesses.(joueur) = 1) then print_string "Impossible !\n" else changement_vitesse jeu joueur (-1)
  | _ -> print_string "\n?????\n\n"

let start () =
  afficher_depart ();
  let jeu = init () in
  let rec boucle ind_joueur = 
    let joueur = ind_joueur mod 2 in
    if (jeu.durabilites.(joueur) <= 0) then afficher_fin_abandon joueur
    else if (jeu.gagnant <> None) then afficher_fin_victoire jeu
    else begin
      afficher jeu joueur;
      print_string "Voulez-vous changer de vitesse ? (o|n) ";
      (match read_line () with
        | "o" -> changer_vitesse jeu joueur
        | "n" -> ()
        | _ -> print_string "\n?????\n");
      Printf.printf "Vitesse actuelle: %se\n" (string_of_int jeu.vitesses.(joueur));
      let nb_cases = (Random.int poids_vitesse.(jeu.vitesses.(joueur)-1).(0) + poids_vitesse.(jeu.vitesses.(joueur)-1).(1)) in
      Printf.printf "Vous avancez de %s cases.\nVeuillez entrer la direction: " (string_of_int nb_cases);
      let direction = read_line () in
      match direction with
      | "h" -> deplacer jeu joueur Haut nb_cases; boucle (joueur+1)
      | "b" -> deplacer jeu joueur Bas nb_cases; boucle (joueur+1)
      | "g" -> deplacer jeu joueur Gauche nb_cases; boucle (joueur+1)
      | "d" -> deplacer jeu joueur Droite nb_cases; boucle (joueur+1)
      | "dhg" -> deplacer jeu joueur DiagonaleHautGauche nb_cases; boucle (joueur+1)
      | "dbg" -> deplacer jeu joueur DiagonaleBasGauche nb_cases; boucle (joueur+1)
      | "dhd" -> deplacer jeu joueur DiagonaleHautDroite nb_cases; boucle (joueur+1)
      | "dbd" -> deplacer jeu joueur DiagonaleBasDroite nb_cases; boucle (joueur+1)
      | dir -> Printf.printf "Déplacement %s inconnu !" dir; boucle (joueur+1)
    end
  in boucle 0
    
let () = start ();;