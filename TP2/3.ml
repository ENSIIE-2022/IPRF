
(* III - Fonctions récursives *)

(* III.1 - calcul de puissance*)
let rec puissance x p =
  match p with
  | 0 -> 1
  | 1 -> x
  | _ -> x * (puissance x (p - 1))
;;
(*test puissance 2  3 ==> 8*)              


(*une façon plus optimal pour calculer la puissance*)
let rec puissance_2 x p =
  match p with    
  | _, 0 -> 1
  | _, 1 -> x
  | _, _ -> match p mod 2 with
    | 0 -> let tmp = (puissance_2 x (p / 2)) in tmp * tmp
    | 1 -> let tmp = (puissance_2 x ((p - 1) / 2)) in x * tmp * tmp
;;


(* III.2 - Fibonacci*)
let rec fibo1 n = match n with
  | 0 -> 0
  | 1 -> 1
  | _ -> fibo1 (n - 1) + fibo1 (n - 2);;

;;