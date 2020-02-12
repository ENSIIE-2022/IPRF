let monnaie somme =
  let rec monnaie_aux s l =
         if s >= 50000 then monnaie_aux(s - 50000) (B500::l)
    else if s >= 20000 then monnaie_aux(s - 20000) (B200::l)
    else if s >= 10000 then monnaie_aux(s - 10000) (B100::l)
    else if s >= 5000  then monnaie_aux(s - 5000 ) (B50::l)
    else if s >= 2000  then monnaie_aux(s - 2000 ) (B20::l)
    else if s >= 1000  then monnaie_aux(s - 1000 ) (B10::l)
    else if s >= 500   then monnaie_aux(s - 500  ) (B5::l)
    else if s >= 200   then monnaie_aux(s - 200  ) (E2::l)
    else if s >= 100   then monnaie_aux(s - 100  ) (E1::l)
    else if s >= 50    then monnaie_aux(s - 50   ) (C50::l)
    else if s >= 20    then monnaie_aux(s - 20   ) (C20::l)
    else if s >= 10    then monnaie_aux(s - 10   ) (C10::l)
    else if s >= 5     then monnaie_aux(s - 5    ) (C5::l)
    else if s >= 2     then monnaie_aux(s - 2    ) (C2::l)
    else if s >= 1     then monnaie_aux(s - 1    ) (C1::l)
    (* s = 0 *)
    else l
  in
   monnaie_aux somme []
;;
