//Sdoi2010]µØ¾«²¿Âä
var
        n,mo,i,j:longint;
        f:array[0..1,0..10000]of longint;
begin
assign(input,'1925.in'); reset(input);
assign(output,'1925.out'); rewrite(output);
        readln(n,mo);
        f[1,1]:=1;
        for i:=2 to n do
        for j:=1 to i do
        f[(i and 1),j]:=(f[((i+1) and 1),i-j]+f[(i and 1),j-1])mod mo;
        writeln((f[(n and 1),n]*2)mod mo);
close(output);
end.