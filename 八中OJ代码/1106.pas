//POI2007]立方体大作战tet
var	s,p:array[0..200000]of longint;
	n,i,x,ans:longint;
procedure init(x,o:longint);
begin while x<=n do begin inc(s[x],o); inc(x,x and(-x)); end;
end;
function get(x:longint):longint;
begin get:=0; while x>0 do begin inc(get,s[x]); dec(x,x and(-x)); end;
end;
begin
readln(n); n:=n*2;
for i:=1 to n do begin
	readln(x);
	if p[x]=0 then begin p[x]:=i; init(i,1); end
	else begin init(p[x],-1); inc(ans,get(i)-get(p[x]-1)); end;
end;
writeln(ans);
end.