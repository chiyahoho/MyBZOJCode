//Usaco2008 Nov]mixup2 »ìÂÒµÄÄÌÅ£
var
	n,kk,i,j,opt:longint;
	ans:int64;
	a,g:array[0..20]of longint;
	f:array[0..70000,0..20]of int64;
begin
assign(input,'1231.in'); reset(input);
assign(output,'1231.out'); rewrite(output);
	readln(n,kk);
	for i:=1 to n do readln(a[i]);
	g[1]:=1; for i:=2 to n+1 do g[i]:=g[i-1]*2;
	for i:=1 to n do f[g[i],i]:=1;
	for opt:=1 to g[n+1]-1 do
	for j:=1 to n do if f[opt,j]>0 then
	for i:=1 to n do if (opt and g[i]=0)and(abs(a[i]-a[j])>kk) then
		f[opt+g[i],i]:=f[opt+g[i],i]+f[opt,j];
	for i:=1 to n do ans:=ans+f[g[n+1]-1,i];
	writeln(ans);
close(output);
end.