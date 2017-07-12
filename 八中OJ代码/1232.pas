//Usaco2008Nov]°²Î¿ÄÌÅ£cheer
var
	fa,a:array[0..200000]of longint;
	e:array[0..200000]of record u,v,l:longint; end;
	n,m,i,ans:longint;

procedure swap(var a,b:longint);
var c:longint; begin c:=a; a:=b; b:=c; end;

procedure sort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=e[(l+r)>>1].l;
  repeat
    while e[i].l<x do inc(i);
    while x<e[j].l do dec(j);
    if not(i>j) then begin
      swap(e[i].u,e[j].u);
      swap(e[i].v,e[j].v);
      swap(e[i].l,e[j].l);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

function gf(u:longint):longint;
begin
	if u=fa[u] then exit(u);
	fa[u]:=gf(fa[u]);
	exit(fa[u]);
end;

begin
assign(input,'1232.in'); reset(input);
assign(output,'1232.out'); rewrite(output);
	readln(n,m);
	ans:=maxlongint;
	for i:=1 to n do begin readln(a[i]); if a[i]<ans then ans:=a[i]; end;
	for i:=1 to m do begin
		readln(e[i].u,e[i].v,e[i].l);
		e[i].l:=a[e[i].u]+a[e[i].v]+2*e[i].l;
	end;
	sort(1,m);
	for i:=1 to n do fa[i]:=i;
	for i:=1 to m do if gf(e[i].u)<>gf(e[i].v) then begin
		fa[gf(e[i].u)]:=gf(e[i].v);
		inc(ans,e[i].l);
	end;
	writeln(ans);
close(output);
end.