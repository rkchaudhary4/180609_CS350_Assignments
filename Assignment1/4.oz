declare
fun {IsDiagonal M}
   local CheckRow in
      fun {CheckRow S K Col P}
	 if S == nil
	 then
	    if P.2 == nil
	    then true
	    else {CheckRow P.2.1 K+1 1 P.2}
	    end
	 elseif {And (K \= Col) (S.1 \= 0)}
	 then false
	    else {CheckRow S.2 K Col+1 P}
	 end
      end
      {CheckRow M.1 1 1 M}
   end
end