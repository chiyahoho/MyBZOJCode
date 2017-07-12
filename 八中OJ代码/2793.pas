Poi2012]Vouchers
var
	n,i,m,maxx,j,t,x:longint;
	now:int64;
	luck,f:array[0..2000000]of boolean;
	nt:array[0..2000000]of longint;
	ans:array[0..2000000]of int64;
begin
assign(input,'2793.in'); reset(input);
assign(output,'2793.out'); rewrite(output);
	readln(m);
	for i:=1 to m do begin
		readln(x);
		if x>maxx then maxx:=x;
		luck[x]:=true;
	end;
	readln(n);
	for i:=1 to maxx do nt[i]:=i;
	for i:=1 to n do begin
		readln(x);
		t:=nt[x];
		for j:=1 to x do begin
			while f[t] and(t<=maxx) do inc(t,x);
			f[t]:=true;
			if t>maxx then break;
			if luck[t] then begin inc(ans[0]); ans[ans[0]]:=now+j; end;
		end;
		inc(now,x); nt[x]:=t;
	end;
	for i:=0 to ans[0] do writeln(ans[i]);
close(output);
end.
