(* 4.1 *)
let affiche_pair n =
  if n mod 2 = 0 then
    Printf.printf "Pair !"
  else
    Printf.printf "Impair !"
;;
(* 4.2 *)
let is_pair n = n mod 2 = 0;;

(* 4.3 => On calcul le max entre x et y puis le max entre ce résultat et z *)
let max_3 x y z =
  max (max x y) z
;;

(* 4.4 *)
let triRect a y h =
  a * a + y * y = h * h
;;

(* 4.5 *)
let existTriRect a y c =
  triRect a y c || triRect a c y || triRect c y a
;;