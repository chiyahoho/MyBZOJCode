//Poi2012]Distance
const	oo=maxlongint>>1;
var
	i,maxa,n,j,ans,k:longint;
	s,f,p,q,a:array[0..200]of longint;

procedure tget(a,b:longint; var c,d:longint);
begin if (a<c)or((a=c)and(b<d)) then begin c:=a; d:=b; end; end;

begin
assign(input,'2790.in'); reset(input);
assign(output,'2790.out'); rewrite(output);
	readln(n);
	for i:=1 to n do begin read(a[i]); if a[i]>maxa then maxa:=a[i]; end;
	for i:=2 to maxa do f[i]:=i;
	for i:=2 to maxa do begin
		if f[i]=i then begin inc(q[0]); q[q[0]]:=i; end;
		for j:=1 to q[0] do begin
			if q[j]*i>maxa then break;
			f[q[j]*i]:=q[j];
			if i mod q[j]=0 then break;
		end;
	end;
	for i:=2 to maxa do f[i]:=f[i div f[i]]+1;
	for i:=1 to maxa do s[i]:=oo;

	for i:=1 to n do
	for j:=1 to trunc(sqrt(a[i])) do if a[i] mod j=0 then begin
			tget(f[a[i] div j],a[i],s[j],p[j]);
			if j<>1 then tget(f[j],a[i],s[a[i] div j],p[a[i] div j]);
	end;
	for i:=1 to n do begin
		ans:=oo;
		for j:=1 to trunc(sqrt(a[i])) do if a[i] mod j=0 then begin
			tget(s[j]+f[a[i] div j],p[j],ans,k);
			tget(s[a[i] div j]+f[j],p[a[i] div j],ans,k);
		end;
		writeln(k);
	end;
close(output);
end.
