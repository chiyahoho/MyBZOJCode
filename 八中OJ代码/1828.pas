//Usaco2010 Mar]balloc Å©³¡·ÖÅä
var
        n,m,i,ans:longint;
        a,b,c,t,s:array[0..1000000]of longint;

function min(a,b:longint):longint;
begin if a>b then exit(b); exit(a); end;

procedure swap(var a,b:longint);
var c:longint; begin c:=a; a:=b; b:=c; end;

procedure sort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=a[(l+r)>>1];
  repeat
    while a[i]<x do inc(i);
    while x<a[j] do dec(j);
    if not(i>j) then begin
      swap(a[i],a[j]);
      swap(b[i],b[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

procedure pass(p:longint);
begin
        inc(s[p*2],s[p]); inc(s[p*2+1],s[p]);
        dec(t[p],s[p]); s[p]:=0;
end;

procedure tget(p:longint);
begin
        pass(p*2); pass(p*2+1);
        t[p]:=min(t[p*2],t[p*2+1]);
end;

procedure build(p,l,r:longint);
var     mi:longint;
begin
        if l=r then begin t[p]:=c[l]; exit; end;
        mi:=(l+r)>>1;
        build(p*2,l,mi); build(p*2+1,mi+1,r);
        tget(p);
end;

function get(p,l,r,a,b:longint):longint;
var     mi,tt:longint;
begin
        pass(p);
        if (l=a)and(r=b) then exit(t[p]);
        mi:=(l+r)>>1;
        if b<=mi then tt:=get(p*2,l,mi,a,b)
        else if a>mi then tt:=get(p*2+1,mi+1,r,a,b)
        else begin
                tt:=get(p*2,l,mi,a,mi);
                tt:=min(tt,get(p*2+1,mi+1,r,mi+1,b));
        end;
        exit(tt);
end;

procedure dele(p,l,r,a,b:longint);
var     mi:longint;
begin
        if (l=a)and(r=b) then begin inc(s[p]); exit; end;
        mi:=(l+r)>>1;
        if b<=mi then dele(p*2,l,mi,a,b)
        else if a>mi then dele(p*2+1,mi+1,r,a,b)
        else begin
                dele(p*2,l,mi,a,mi);
                dele(p*2+1,mi+1,r,mi+1,b);
        end;
        tget(p);
end;

begin
assign(input,'1828.in'); reset(input);
assign(output,'1828.out'); rewrite(output);
        readln(n,m);
        for i:=1 to n do readln(c[i]);
        build(1,1,n);
        for i:=1 to m do readln(a[i],b[i]);
        sort(1,m);
        for i:=m downto 1 do
        if get(1,1,n,a[i],b[i])>0 then begin
                dele(1,1,n,a[i],b[i]);
                inc(ans);
        end;
        writeln(ans);
close(output);
end.