(* 2.1 *)
Printf.printf "Bonjour"
(* 2.2 *)
let pseudo = read_line () ;;
Printf.printf ("Bonjour %s\n") pseudo ;;
flush(stdout);;
(* 2.3 *)
(* ========================== VERSION 1 ========================== *)
Scanf.scanf "%s\n" (fun s -> Printf.printf "Bonjour %s\n" s) ;;
(* ========================== VERSION 2 ========================== *)
let scan_string () = Scanf.scanf " %s" (fun x -> x);;

Printf.printf "Quel est votre nom ?\n";;
flush(stdout);;
let answer = scan_string();;
Printf.printf "Bienvenue %s !\n" answer;;
(* 2.4.1
Le compilateur se sert des fichiers .cmi pour gérer les dépendances. 
Lorsqu’il repère une dépendance vers un module Foo, il va chercher implicitement le fichier foo.cmi. S’il ne le trouve pas il échoue avec une erreur du style Unbound module Foo
Le linker se sert des fichiers .cmo pour générer l´exécutable. Il faut préciser explicitement et dans le bon ordre les fichiers .cmo
*)
(* 2.4.2
#!/usr/bin/ocamlrun fait penser à la première ligne d'un fichier bash, c'est surement pour l'interpreteur
*)
(* 2.4.3
cmi, cmx, o
*)
(* 2.4.4
ocamlc    : Compiler vers du bytecode (Obligé d'utiliser ocamlrun)
ocamlopt  : Compiler vers du code natif (Utilisation de ./<executable>)
*)
