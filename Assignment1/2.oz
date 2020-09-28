declare
fun {ZipWith BinOp  X Y}
   if X == nil
      then nil
   else if Y == nil
   	then nil
   else {BinOp X.1 Y.1}|{ZipWith BinOp X.2 Y.2}
   end
   end
end

declare
fun {Map L F}
    {FoldR L fun {$ X Y}{F X}|Y end nil}
end

declare
fun {FoldL BinOp X N}
   case X
   of nil
   then N
   []H|T then {FoldL BinOp T {BinOp H N}}
   end
end