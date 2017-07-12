//Jsoi2009]Æ¿×ÓºÍÈ¼ÁÏ
const mo=950317;
var
        i,n,m,j,x,ans:longint;
        a,b:array[0..10000000]of longint;

procedure ins(x:longint);
var     k:longint;
begin
        if x<=ans then exit;
        k:=x mod mo;
        while (a[k]<>0)and(a[k]<>x) do inc(k);
        if a[k]=0 then a[k]:=x;
        inc(b[k]);
        if b[k]>=m then ans:=x;
end;

begin
assign(input,'2257.in'); reset(input);
assign(output,'2257.out'); rewrite(output);
        readln(n,m);
        for i:=1 to n do begin
                readln(x);
                for j:=1 to trunc(sqrt(x)) do if x mod j=0 then begin
                        ins(j); ins(x div j);
                end;
        end;
        writeln(ans);
close(output);
end.