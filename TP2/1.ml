(* 1.1 Définir un type enuméré euro pour représenter l’ensemble des pièces (1c, 2c, 5c, 10c, 20c, 50c, 1e, 2e) et billets (5e, 10e, 20e, 50e, 100e, 200e, 500e) de l’euro. *)
type euro = C1 | C2 | C5 | C10 | C20 | C50 | E1 | E2 | E5 | E10 | E20 | E50 | E100 | E200 | E500 ;;

(* 1.2 Écrire une fonction est_billet: euro -> bool qui retourne true si l’argument passé correspond à un billet, et false sinon. *)
let est_billet value = 
  match value with
  | E5 | E10 | E20 | E50 | E100 | E200 | E500 -> true
  | _ -> false;;

(* 1.3 Écrire une fonction montant: euro list -> int calculant le montant (en centimes) correspondant à la liste de pièces/billets passée en argument. *)
let rec montant my_list =
  let value e = match e with
  | C1 -> 1
  | C2 -> 2
  | C5 -> 5
  | C10 -> 10
  | C20 -> 20
  | C50 -> 50
  | E1 -> 100
  | E2 -> 200
  | E5 -> 500
  | E10 -> 1000
  | E20 -> 2000
  | E50 -> 5000
  | E100 -> 10000
  | E200 -> 20000
  | E500 -> 50000
  in
  match my_list with
  | [] -> 0
  | a::q -> (value a) + (montant q)
;;

(* 1.4 Écrire une fonction monnaie: int -> euro list qui, sur la donnée d’une somme en centimes, renvoie une liste de pièces/billets la plus courte possible correspondant à cette somme.*)
let rec monnaie somme =
  if somme = 0 then
    []
  else if somme >= 50000 then E500::(monnaie (somme-50000))
  else if somme >= 20000 then E200::(monnaie (somme-20000))
  else if somme >= 10000 then E100::(monnaie (somme-10000))
  else if somme >= 5000 then E50::(monnaie (somme-5000))
  else if somme >= 2000 then E20::(monnaie (somme-2000))
  else if somme >= 1000 then E10::(monnaie (somme-1000))
  else if somme >= 500 then E5::(monnaie (somme-500))
  else if somme >= 200 then E2::(monnaie (somme-200))
  else if somme >= 100 then E1::(monnaie (somme-100))
  else if somme >= 50 then C50::(monnaie (somme-50))
  else if somme >= 20 then C20::(monnaie (somme-20))
  else if somme >= 10 then C10::(monnaie (somme-10))
  else if somme >= 5 then C5::(monnaie (somme-5))
  else if somme >= 2 then C2::(monnaie (somme-2))
  else somme >= 1 then C1::(monnaie (somme-1))
;;

Printf.printf "%b\n" (est_billet E10);;
Printf.printf "%d\n" (montant [E10;E20;C1]);;

(*
(* I - Enregistrement et couples : la définition des types en ocaml*)

(*Définition d'un type avec les enregistrements pour la gestion des fractions p est le numérateur et q est le dénominateur
  -> creation : let x = { p = 1 ; q = 3 }
  -> accés 1er element : x.p 
  -> accés 2éme element : x.q
*)
type rat = { p : int ; q : int};;

(*fonction pour afficher un rationnel*)
let show x = Printf.printf " %i / %i \n" x.p x.q;;

(*Addition de 2 nombres rationnel*)
let add x y = { p = x.p * y.q + y.p * x.q ; q = x.q * y.q };;
let x = { p = 1 ; q = 3}
let y = { p = 2 ; q = 1}
let add_x_y = add x y;;
show add_x_y;;




(*affichage des coupples implementer a base de couple*)
let show_2 x = Printf.printf " %i / %i \n" (fst x) ( snd x);;

(*Un type pour les rationnels avec les couples
  -> creation : let x = Rat( 1, 3)
  -> accés 1er element : fst x
  -> accés 2éme element : snd x
*)
type rat_2 =  int * int;;
let x = ( 1, 3);;
let add_2 x y = ( (fst x) * (snd y) + (fst y) * (snd x) , (snd x) * (snd y) ) ;; 
let x = ( 1, 3);;
let y = ( 1, 3);;
let add_x_y = add_2 x y;;
show_2 add_x_y;;
         
(* II - types sommes et énumérés*)

(* II.1 - mixité somme et types énumérés*)

(*Définition du type nombre*)
type nombre = | Int  of int | Float of float ;;

(*Pour les tests des opérations définie par la suite il faut faire add (Int 5) (Float 5.4)....*)
(*Définition des opération sur les nombres*)
(*Addition*)
let add a b =
  match a, b with
  | Int ia, Int ib -> Int (ia + ib)
  | Float fa, Float fb -> Float (fa +. fb)
  | Float fa, Int ib -> Float (fa +. (float_of_int ib))
  | Int ia, Float fb -> Float ((float_of_int ia) +. fb);
;;

(*Multiplication*)
let mul a b =
  match a, b with
  | Int ia, Int ib -> Int (ia * ib)
  | Float fa, Float fb -> Float (fa *. fb)
  | Float fa, Int ib -> Float (fa *. (float_of_int ib))
  | Int ia, Float fb -> Float ((float_of_int ia) *. fb);;

;;

(*Sustraction*)
let sub a b =
  match a, b with
  | Int ia, Int ib -> Int (ia - ib)
  | Float fa, Float fb -> Float (fa -. fb)
  | Float fa, Int ib -> Float (fa -. (float_of_int ib))
  | Int ia, Float fb -> Float ((float_of_int ia) -. fb);;

;;  

(*Division*)
let div a b =
  match a, b with
  | Int ia, Int ib -> Int (ia / ib)
  | Float fa, Float fb -> Float (fa /. fb)
  | Float fa, Int ib -> Float (fa /. (float_of_int ib))
  | Int ia, Float fb -> Float ((float_of_int ia) /. fb);;
;;

(*Fonction de comparaison *)
let less_than a b =
  match a, b with
  | Int ia, Int ib -> ia < ib
  | Float fa, Float fb -> fa < fb
  | Float fa, Int ib -> fa < (float_of_int ib)
  | Int ia, Float fb -> (float_of_int ia) < fb;;
;;
*)