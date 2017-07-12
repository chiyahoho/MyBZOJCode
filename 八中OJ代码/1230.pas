//Usaco2008 Nov]lites ¿ª¹ØµÆ
var
	n,m,i,ca,l,r:longint;
	re:array[0..1000000]of boolean;
	s:array[0..1000000]of longint;

procedure pass(p,l,r:longint);
begin
	if not re[p] then exit;
	re[p]:=false; s[p]:=r-l+1-s[p];
	re[p*2]:=not re[p*2]; re[p*2+1]:=not re[p*2+1];
end;

procedure tget(p,l,r:longint);
var	mi:longint;
begin
	mi:=(l+r)>>1;
	pass(p*2,l,mi); pass(p*2+1,mi+1,r);
	s[p]:=s[p*2]+s[p*2+1];
end;

procedure change(p,l,r,a,b:longint);
var	mi:longint;
begin
	pass(p,l,r);
	if (l=a)and(r=b) then begin re[p]:=true; exit; end;
	mi:=(l+r)>>1;
	if b<=mi then change(p*2,l,mi,a,b)
	else if a>mi then change(p*2+1,mi+1,r,a,b)
	else begin change(p*2,l,mi,a,mi); change(p*2+1,mi+1,r,mi+1,b); end;
	tget(p,l,r);
end;

function get(p,l,r,a,b:longint):longint;
var	mi,ans:longint;
begin
	mi:=(l+r)>>1;
	pass(p,l,r);
	if (l=a)and(r=b) then exit(s[p]);
	if b<=mi then exit(get(p*2,l,mi,a,b))
	else if a>mi then exit(get(p*2+1,mi+1,r,a,b))
	else begin
		ans:=get(p*2,l,mi,a,mi);
		inc(ans,get(p*2+1,mi+1,r,mi+1,b));
		exit(ans);
	end;
end;

begin
assign(input,'1230.in'); reset(input);
assign(output,'1230.out'); rewrite(output);
	readln(n,m);
	for i:=1 to m do begin
		readln(ca,l,r);
		if ca=0 then change(1,1,n,l,r) else writeln(get(1,1,n,l,r));
	end;
close(output);
end.
