type 'a tree = Empty | Node of 'a * 'a tree * 'a tree;;

let rec tree_max t =
  match t with
  | Empty -> min_int
  | Node (v, fg, fd) ->
    let (maxg, maxd) = (tree_max fg, tree_max fd) in
      let maxgd = if (maxg < maxd) then maxd else maxg in
        if(v < maxgd) then maxgd else v
;;

(* Renvoie un arbre avec n noeuds de valeurs comprises entre 0 et 100 *)
let rec int_tree_aleatoire n =
  if n = 0 then Empty
  else
    let fg = if Random.int 10 < 9 then int_tree_aleatoire (n-1) else Empty 
    and fd = if Random.int 10 < 9 then int_tree_aleatoire (n-1) else Empty in Node (Random.int 100, fg, fd);;

let rec hauteur t =
  match t with
  | Empty -> 0
  | Node (_, fg, fd) ->
    let (hg, hd) = (hauteur fg, hauteur fd) in
    1 + (if hg < hd then hd else hg)
;;

let rec list_of_tree t =
  match t with
  | Empty -> []
  | Node (v, fg, d) -> (list_of_tree fg)@v::(list_of_tree fg)
;;

let rec tree_map f t =
  match t with
  | Empty -> Empty
  | Node (v, fg, fd) -> Node (f v, tree_map f fg, tree_map f fd)
;;

(* ('a -> 'b -> 'a) -> 'a -> 'b tree -> 'a *)
let rec tree_fold_infixe f acc t =
  match t with
  | Empty -> acc
  | Node (v, fg, fd) ->
    let accg = tree_fold_infixe f acc fg in
      let accgv = f accg v in
        tree_fold_infixe f accgv fd
;;

let tree_min_max = tree_fold_infixe
  (fun (min, max) -> fun e ->
    if (e < min && e > max) then (e, e)
    else if e < min then (e, max)
    else if e > max then (min, e)
    else (min, max))
  (max_int, min_int)
;;