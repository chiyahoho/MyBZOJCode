//Poi2012]Warehouse Store
var
      i,n,tot:longint;
      s:int64;
      a,b,t,p:array[0..1000000]of longint;
      f:array[0..1000000]of boolean;

procedure swap(var a,b:longint);
var c:longint; begin c:=a; a:=b; b:=c; end;

procedure insert(i:longint);
var   v:longint;
begin
      inc(tot);
      t[tot]:=b[i]; p[tot]:=i;
      v:=tot;
      while (v>1)and(t[v]>t[v>>1]) do begin
            swap(t[v],t[v>>1]);
            swap(p[v],p[v>>1]);
            v:=v>>1;
      end;
end;

procedure delete;
var   v,k:longint;
begin
      f[p[1]]:=false;
      t[1]:=t[tot]; p[1]:=p[tot];
      dec(tot); v:=1;
      while v<=tot>>1 do begin
            k:=v<<1;
            if (k<tot)and(t[k]<t[k+1]) then inc(k);
            if t[v]>=t[k] then break;
            swap(t[v],t[k]);
            swap(p[v],p[k]);
            v:=k;
      end;
end;

begin
assign(input,'2802.in'); reset(input);
assign(output,'2802.out'); rewrite(output);
      readln(n);
      for i:=1 to n do read(a[i]); readln;
      for i:=1 to n do read(b[i]);
      for i:=1 to n do begin
            inc(s,a[i]);
            if (s>=b[i])or(t[1]>b[i]) then begin insert(i); dec(s,b[i]); f[i]:=true; end;
            if s<0 then begin inc(s,t[1]); delete; end;
      end;
      writeln(tot);
     // for i:=1 to n do if f[i] then write(i,' ');
close(output);
end.
