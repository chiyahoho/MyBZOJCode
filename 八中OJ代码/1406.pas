//AHOI2007]ÃÜÂëÏä
const mo=950317;
var
        n,a,b,t,k,tot,i:longint;
        h,q:array[0..8000000]of longint;

procedure swap(var a,b:longint);
var c:longint; begin c:=a; a:=b; b:=c; end;

procedure sort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=q[(l+r)>>1];
  repeat
    while q[i]<x do inc(i);
    while x<q[j] do dec(j);
    if not(i>j) then begin
      swap(q[i],q[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

procedure ins(n:longint);
var     k:longint;
begin
        k:=n mod mo;
        while (h[k]<>0)and(h[k]<>n) do inc(k);
        if h[k]=0 then begin
                h[k]:=n;
                inc(tot);
                q[tot]:=n;
        end;
end;

begin
assign(input,'1406.in'); reset(input);
assign(output,'1406.out'); rewrite(output);
        readln(n);
        for a:=1 to trunc(sqrt(n)) do if n mod a=0 then begin
                b:=n div a; k:=0;
                for t:=1 to a do begin
                        inc(k,b);
                        if (k-2)mod a=0 then ins(k-1);
                        if (t<>a)and((k+2)mod a=0) then ins(k+1);
                end;
        end;

                sort(1,tot);
                writeln(1); for i:=1 to tot do writeln(q[i]);
close(output);
end.
