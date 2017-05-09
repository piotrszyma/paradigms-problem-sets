declare
T7 = tree(key:17 value:8 left:nil right:nil)
T6 = tree(key:12 value:5 left:nil right:nil)
T5 = tree(key:3 value:8 left:nil right:nil)
T4 = tree(key:1 value:8 left:nil right:nil)
T3 = tree(key:13 value:5 left:T6 right:T7)
T2 = tree(key:2 value:4 left:T4 right:T5)
T1 = tree(key:5 value:4 left:T2 right:T3)

proc {DisplayTree T}
   if T.left\=nil then
      {DisplayTree T.left}
   end
   {Browse T.key}
   if T.right\=nil then
      {DisplayTree T.right}
   end
end

fun {FindAll T V}
   if T == nil then
      nil
   else
      if T.value == V then {Append {FindAll T.left V} T.key|{FindAll T.right V}}
      else {Append {FindAll T.left V} {FindAll T.right V}}
      end
   end
end

L = {FindAll T1 4}
{Browse L}