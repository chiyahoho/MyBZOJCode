//bzoj2502: 清理雪道  2011福建集训
const oo=maxlongint>>2;
var
  tot,u,v,ss,tt,x,y,n,m,up,ans,i:longint;
  g,vg,h:array[0..300]of longint;
  e:array[0..100000]of record v,l,b,n:longint; end;

function min(a,b:longint):longint;
begin if a>b then exit(b); exit(a); end;

procedure add(u,v,l:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].n:=h[u];
  e[tot].b:=tot+1;
  h[u]:=tot;

  inc(tot);
  e[tot].v:=u;
  e[tot].l:=0;
  e[tot].n:=h[v];
  e[tot].b:=tot-1;
  h[v]:=tot;
end;

function sap(u,flow:longint):longint;
var
  y,v,ff:longint;
begin
  if u=tt then exit(flow);
  sap:=0;
  y:=h[u];
  while y>0 do begin
      v:=e[y].v;
      if (v<=up)and(g[u]=g[v]+1)and(e[y].l>0) then begin
            ff:=sap(v,min(flow-sap,e[y].l));
            inc(sap,ff);
            dec(e[y].l,ff);
            inc(e[e[y].b].l,ff);
            if sap=flow then exit;
      end;
      y:=e[y].n;
  end;
  if g[ss]=up then exit;
  dec(vg[g[u]]); if vg[g[u]]=0 then g[ss]:=up;
  inc(g[u]); inc(vg[g[u]]);
end;

begin
assign(input,'2502.in'); reset(input);
assign(output,'2502.out'); rewrite(output);
  readln(n);
  ss:=0; tt:=n+1; x:=n+2; y:=n+3;
  for u:=1 to n do begin
      add(ss,u,oo);
      add(u,tt,oo);
      read(m);
      for i:=1 to m do begin
            read(v);
            add(u,v,oo);
            add(u,x,1);
            add(y,v,1);
      end;
  end;
  add(tt,ss,oo);

  ss:=y; tt:=x; up:=n+3;
  g[ss]:=1; vg[1]:=1; vg[0]:=oo;
  while g[ss]<up do sap(ss,oo);
  ans:=e[tot].l;

  e[tot].l:=0; e[tot-1].l:=0;
  ss:=n+1; tt:=0; up:=n+1;
  fillchar(g,sizeof(g),0);
  fillchar(vg,sizeof(vg),0);
  g[ss]:=1; vg[1]:=1; vg[0]:=oo;
  while g[ss]<up do dec(ans,sap(ss,oo));

  writeln(ans);
close(output);
end.
