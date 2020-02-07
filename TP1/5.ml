(* 5.1 *)
let deux_elts l =
  match l with
  | [] -> false
  | a::[] -> false
  | a::b::[] -> true
  | _ -> false

(* 5.2 *)
let third t =
  let (a,b,c) = t in
  c
;;

Printf.printf "%b" (deux_elts [1;6;12])