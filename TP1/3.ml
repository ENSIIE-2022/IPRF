let scan_string () = Scanf.scanf " %s" (fun x -> x);;

Printf.printf "Quel est votre nom ?\n";;
flush(stdout);;
let answer = scan_string();;
Printf.printf "Bienvenue %s !\n" answer;;
