type nombre = Int of int | Real of float ;;

(* 2.1 Écrire une fonction division qui prend en argument deux éléments de type nombre et qui calcule le quotient de ces deux nombres. On utilisera le type int autant que possible. *)
let division a b =
  match a, b with
  | Int ia, Int ib -> Int (ia / ib)
  | Real fa, Real fb -> Real (fa /. fb)
  | Real fa, Int ib -> Real (fa /. (float_of_int ib))
  | Int ia, Real fb -> Real ((float_of_int ia) /. fb)
;;


(* 2.2 Écrire une fonction compare_nombre qui prend en argument deux éléments de type nombre et qui renvoie -1 si le premier nombre est strictement plus petit que le deuxième, 0 si les deux nombes sont égaux, et 1 sinon *)
let compare_nombre a b =
  match a, b with
  | Int ia, Int ib -> ia < ib
  | Real fa, Real fb -> fa < fb
  | Real fa, Int ib -> fa < (float_of_int ib)
  | Int ia, Real fb -> (float_of_int ia) < fb
;;

