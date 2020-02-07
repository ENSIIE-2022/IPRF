let pi = 4. *. atan 1. ;;
(* 3.1 *)
let cube n =
  n ** 3. ;;
(* 3.2 *)
let volume r =
  (cube r) *. pi *. 4. /. 3. ;;
(* 3.3 *)
let surface_et_volume r = 
  let surface = 4. *. pi *. r in
  (surface, volume r);;

  cube 3.