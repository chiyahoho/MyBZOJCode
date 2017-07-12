//SDOI2009]³¿ÅÜ
const oo=maxlongint>>1;
var
  e:array[0..1000000]of record l,v,b,n,c:longint; end;
  pre:array[0..10000]of record v,e:longint; end;
  d,h,q:array[0..100000]of longint;
  f:array[0..10000]of boolean;
  ans,tot,n,x,ss,tt,bu,qw,sw,qd,sd,i,m,u,v,c:longint;

procedure add(u,v,l,c:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].c:=c;
  e[tot].b:=tot+1;
  e[tot].n:=h[u];
  h[u]:=tot;

  inc(tot);
  e[tot].v:=u;
  e[tot].l:=0;
  e[tot].c:=-c;
  e[tot].b:=tot-1;
  e[tot].n:=h[v];
  h[v]:=tot;
end;

function relax(u,y,v:longint):boolean;
begin
  if d[u]+e[y].c<d[v] then begin
      d[v]:=d[u]+e[y].c;
      pre[v].v:=u;
      pre[v].e:=y;
      exit(true);
  end;
  exit(false);
end;

function spfa:boolean;
var
  i,l,r,u,v,y,k:longint;
begin
  for i:=ss to tt do begin
      d[i]:=oo;
      f[i]:=false;
      pre[i].v:=-1;
      pre[i].e:=0;
  end;
  l:=0; r:=1;
  q[1]:=ss; d[ss]:=0;
  while l<r do begin
      inc(l);
      u:=q[l]; f[u]:=false;
      y:=h[u];
      while y>0 do begin
            v:=e[y].v;
            if (e[y].l>0)and relax(u,y,v) and not f[v] then begin
                  f[v]:=true;
                  inc(r);
                  q[r]:=v;
            end;
            y:=e[y].n;
      end;
  end;
  if d[tt]>=oo then exit(false);
  k:=oo; v:=tt;
  while pre[v].v<>-1 do begin
      if e[pre[v].e].l<k then k:=e[pre[v].e].l;
      v:=pre[v].v;
  end;
  v:=tt;
  while pre[v].v<>-1 do begin
      y:=pre[v].e;
      inc(ans,e[y].c*k);
      dec(e[y].l,k); inc(e[e[y].b].l,k);
      v:=pre[v].v;
  end;
  exit(true);
end;
begin
assign(input,'1877.in'); reset(input);
assign(output,'1877.out'); rewrite(output);
        readln(n,m);
        ss:=1; tt:=n+n;
        for i:=1 to m do begin
                readln(u,v,c);
                add(u+n,v,1,c);
        end;
        for i:=2 to n-1 do add(i,i+n,1,0);
        add(1,n+1,oo,0); add(n,tt,oo,0);
        while spfa do;
        writeln(e[tot].l,' ',ans);
close(output);
end.
