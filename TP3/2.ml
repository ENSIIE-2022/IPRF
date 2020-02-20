type expr = Const of int | Var of string | Plus of expr * expr | Neg of expr | Minus of expr * expr | Mult of expr * expr ;;

