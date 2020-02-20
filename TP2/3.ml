(* 3.1 Écrire une fonction récursive produit qui, sur la donnée d’une liste d’entiers, renvoie le produit de tous les éléments de cette liste.*)
let rec produit l =
  match l with
  | [] -> 1
  | a::[] -> a
  | t::q -> t * produit q
;;

Printf.printf "%d\n" (produit [1;2;3;4;5]);;

(* 3.2 Écrire une fonction récursive carre_liste qui, sur la donnée d’une liste d’entiers l, renvoie la liste des carrés des éléments de l.*)
let rec carre_liste l =
  match l with
  | [] -> []
  | t::h -> (t * t)::(carre_liste h)
;;

let () = List.iter (printf "%d ") (carre_list [1;2;3;4]);;


(* 3.3 Écrire une fonction récursive min_max qui, sur la donnée d’une liste d’entiers, renvoie le couple formé du plus petit et du plus grand entier dans cette liste.*)
let rec min_max l =
  let rec aux mymin mymax l =
    match l with
  | [] -> (mymin,mymax)
  | t::h -> aux (min mymin t) (max mymax t) h
  in aux max_int min_int l
;;

(* note : Pour la liste vide, on pourra renvoyer (max_int, min_int). Pourquoi ?*)

(* 3.4 Écrire une fonction récursive recherche qui, sur la donnée d’un élément e et d’une liste l, renvoie true si e apparaît dans l, et false sinon.*)
let rec recherche e l =
  match l with
  | [] -> false
  | t::q -> if t=e then
              true
            else
              recherche e q
;;

(* 3.5 Écrire une fonction récursive nb_occurrence qui, sur la donnée d’un élément e et d’une liste l, renvoie le nombre de fois où e apparaît dans l.*)
let rec nb_occurrence e l =
  match l with
  | [] -> 0
  | t::q -> if t=e then
              1 + nb_occurrence e q
            else
              nb_occurrence e q
;;


(* 3.6 Écrire une fonction récursive nub qui, sur la donnée d’une liste l, renvoie la liste sans les doublons. Par exemple, nub [1;1;2;3;1;4] devra retourner [1;2;3;4] ou [2;3;1;4] (selon l’algorithme utilisé). *)
let rec nub l =
  match l with
  | [] -> []
  | t::q -> if recherche t q then
              nub q
            else
              t::(nub q)
;;

(* 3.7 Refaire les questions précédentes sans utiliser de fonctions récursives. Utiliser pour cela les fonctions du module List, notamment List.map et List.fold_left/List.fold_right. *)

let produit_bis = List.fold_left ( * ) 1 ;;

let carre_liste_bis = List.map ( fun x -> x*x) ;;

let min_max_bis = List.fold_left (fun (a,b) -> fun e -> ( min a e , max b e) ) (max_int , min_int) ;;

let recherche_bis e l = List.fold_left (fun c -> fun i -> c || i=e) false l ;;

let nb_occ_bis e l = List.fold_left ( fun c -> fun i -> if e=i then c+1 else c) 0 l ;;

let nub_bis = List.fold_left ( fun c -> fun e -> if recherche_bis e c then c else e::c) [] ;;
