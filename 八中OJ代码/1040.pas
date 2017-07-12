//[ZJOI2008]ÆïÊ¿
var
  ans,t:int64;
  v,u,i,n,tot,head,top,cc:longint;
  fa,h,a,bel,low,dfn,q:array[0..1200000]of longint;
  d1,d2:array[0..1200000]of int64;
  vis,let,ff,f:array[0..1200000]of boolean;
  e:array[0..2000000]of record v,n:longint; end;

function max(a,b:int64):int64;
begin if a>b then exit(a); exit(b); end;
function min(a,b:int64):int64;
begin if a>b then exit(b); exit(a); end;

procedure add(u,v:longint);
begin
  fa[v]:=u;
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

procedure dfs(u:longint);
var v,y:longint;
begin
  vis[u]:=true; d1[u]:=0; d2[u]:=a[u];
  y:=h[u];
  while y>0 do begin
      v:=e[y].v;
      if (u=head)or((v<>fa[u])and(v<>head)) then begin
            dfs(v);
            inc(d1[u],max(d1[v],d2[v]));
            inc(d2[u],d1[v]);
      end;
      y:=e[y].n;
  end;
  if let[u] then d2[u]:=0;
end;

procedure tarjan(u:longint);
var
  y,v,i:longint;
begin
  inc(cc); dfn[u]:=cc; low[u]:=cc;
  inc(top); q[top]:=u;
  f[u]:=true; ff[u]:=true;
  y:=h[u];
  while y>0 do begin
    v:=e[y].v;
    if not f[v] then begin
      tarjan(v);
      low[u]:=min(low[u],low[v]);
    end
    else if ff[v] then low[u]:=min(low[u],dfn[v]);
    y:=e[y].n;
  end;

  if dfn[u]=low[u] then repeat
      v:=q[top];
      dec(top);
      ff[v]:=false;
      bel[v]:=u;
  until u=v;
end;

begin
assign(input,'1040.in'); reset(input);
assign(output,'1040.out'); rewrite(output);
  readln(n);
  for u:=1 to n do begin
      readln(a[u],v);
      add(v,u);
  end;
  for i:=1 to n do if dfn[i]=0 then tarjan(i);
  for i:=1 to n do if (not vis[i])and(bel[i]<>i) then begin
      head:=i;
      dfs(i); t:=d1[i];
      let[fa[i]]:=true;
      dfs(i); t:=max(t,d2[i]);
      inc(ans,t);
  end;
  writeln(ans);
close(output);
end.
