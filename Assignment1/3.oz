declare
fun {Sin X}
   local SinAux in
      fun lazy {SinAux X Prev N}
	 if Prev == 0.0
	 then X|{SinAux X ~X N+2.0}
	 else
	    local Y=(Prev*X*X)/(N*(N-1.0)) in
	       Y|{SinAux X ~Y N+2.0}
	    end
	 end
      end
      {SinAux X 0.0 1.0}
   end
end

declare
fun {Approximate S Epsilon}
   local Sum in
      fun {Sum S Prev Epsilon}
	 if S == nil
	 then 0.0
	 elseif {Abs Prev - S.1} > Epsilon
	 then 0.0
	 else S.1 + {Sum S.2 S.1 Epsilon}
	 end
      end
      {Sum S S.1 Epsilon}
   end
end