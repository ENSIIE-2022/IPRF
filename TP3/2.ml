type expr = Const of int | Var of string | Plus of expr * expr | Neg of expr | Minus of expr * expr | Mult of expr * expr ;;

type env = (string * int) list;;
(* (x + 4) × y − 5 e *)
Minus (Mult (Plus (Var ("x"), Const (4)), Var ("y")), Const (5));;

let rec vars e =
  match e with
  | Var (s) -> [s]
  | Neg (e) -> vars e
  | Plus (e1, e2)
  | Minus (e1, e2)
  | Mult (e1, e2) -> (vars e1)@(vars e2)
  |_ -> []
;;

let rec eval expr env =
  let rec value env s=
    match env with
    | [] ->failwith "value not found"
    | (ts,ti)::q -> if (ts = s) then ti else (value q s)
  in 
    match expr with
    | Const (i) -> i
    | Var (s) -> value env s
    | Plus (e1, e2) -> (eval e1 env) + (eval e2 env)
    | Neg (e) -> - (eval e env)
    | Minus (e1, e2) -> (eval e1 env) - (eval e2 env)
    | Mult (e1, e2) -> (eval e1 env) * (eval e2 env)
;;

let e2 = Plus (Mult (Minus (Const (1), Const(1)), Var ("y")), Mult (Plus (Const (1), Const (1)), Var ("x")));;

(* Oublie du cas avec le plus et le 0 ? *)
let rec simpl expr =
  match expr with
  |Plus (e1, e2) ->
    (let (es1, es2) = (simpl e1, simpl e2) in
      match (es1, es2) with
      | (Const (c1), Const (c2)) -> Const (c1 + c2)
      |_ -> Plus (es1, es2))
  |Minus (e1, e2) ->
    (let (es1, es2) = (simpl e1, simpl e2) in
      match (es1, es2) with
      | (Const (c1), Const (c2)) -> Const (c1 - c2)
      |_ -> Minus (es1, es2))
  |Mult (e1, e2) ->
    (let (es1, es2) = (simpl e1, simpl e2) in
      match (es1, es2) with
      | (Const (0), _) |(_, Const (0)) -> Const (0)
      | (_, _) -> Mult (es1, es2))
  |Neg (e) -> Neg (simpl e)
  |Const (c) -> Const (c)
  |Var (s) -> Var (s)
;;