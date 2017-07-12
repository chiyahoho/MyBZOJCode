//Usaco2010 Hol]cowpol ÄÌÅ£ÕþÌ³
const   lg=20;
var
        et,n,m,i,u:longint;
        qq,dp,h,bl,fr,ans:array[0..400000]of longint;
        e:array[0..400000]of record v,n:longint; end;
        f:array[0..400000,0..lg]of longint;

procedure tget(a:longint; var b:longint);
begin if a>b then b:=a; end;

procedure add(u,v:longint);
begin
        inc(et);
        e[et].v:=v;
        e[et].n:=h[u];
        h[u]:=et;
end;

procedure bfs;
var     l,r,y,u,v,i,j:longint;
begin
        l:=0; r:=1;
        qq[1]:=0;
        while l<r do begin
                inc(l); u:=qq[l];
                y:=h[u];
                while y>0 do begin
                        v:=e[y].v;
                        dp[v]:=dp[u]+1;
                        f[v,0]:=u;
                        inc(r); qq[r]:=v;
                        y:=e[y].n;
                end;
        end;

        for i:=1 to n+1 do
        for j:=1 to lg do f[qq[i],j]:=f[f[qq[i],j-1],j-1];
end;

function lca(a,b:longint):longint;
var     i,tmp:longint;
begin
        if dp[a]<dp[b] then begin tmp:=a; a:=b; b:=tmp; end;
        for i:=lg downto 0 do if dp[f[a,i]]>=dp[b] then a:=f[a,i];
        for i:=lg downto 0 do if f[a,i]<>f[b,i] then begin a:=f[a,i]; b:=f[b,i]; end;
        if a<>b then exit(f[a,0]) else exit(a);
end;

begin
assign(input,'1776.in'); reset(input);
assign(output,'1776.out'); rewrite(output);
        readln(n,m);
        for i:=1 to n do begin
                readln(bl[i],u);
                add(u,i);
        end;
        bfs;

        for i:=1 to n do if dp[i]>dp[fr[bl[i]]] then fr[bl[i]]:=i;
        for i:=1 to n do
        tget( dp[fr[bl[i]]]+dp[i]-2*dp[lca(fr[bl[i]],i)] , ans[bl[i]] );

        for i:=1 to m do writeln(ans[i]);
close(output);
end.