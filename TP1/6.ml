(* 6.1 *)
let rec pow x n =
  if n = 0 then
    1
  else
    x * pow x (n-1)
;;

(* 6.2 *)
let rec pow2 x n =
  if n = 0 then
    1
  else if n mod 2 = 0 then
    pow2 (x*x) (n/2)
  else
    x *pow2 (x*x) (n/2)
;;

(*
pow1 donne un stack overflow, pow2 donne une résultat incorrect à partir de 13 car on dépasse le max_int de OCAML
Printf.printf "%d" (pow 2 2)
Printf.printf "%d" (pow2 2 2)
*)
