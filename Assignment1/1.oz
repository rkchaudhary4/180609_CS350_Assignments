declare
fun {Take L N}
   if N < 1
   then nil
   else
        case L
        of nil
        then nil
        [] H|T then H|{Take T N-1}
        end
   end
end

declare
fun {Last X N}
   if N >= {Length X} then X
   else if N =< 0 then nil
	else
	   case X
	   of nil
	   then nil
	   [] H|T then {Last T N}
	   end
	end
   end
end

declare
fun {Merge X Y}
   if X == nil
   then Y
   else if Y == nil
	then X
	else if X.1 < Y.1 then X.1|{Merge X.2 Y}
	     else Y.1|{Merge X Y.2}
	     end
	end
   end
end