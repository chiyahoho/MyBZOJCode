//Ahoi2008]Meet ½ô¼±¼¯ºÏ
const   lg=22;
var
        i,n,m,a,b,c,p,q,k,et,u,v:longint;
        e:array[0..1100000]of record v,n:longint; end;
        dp,h,qq:array[0..600000]of longint;
        f:array[0..600000,0..lg+1]of longint;

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
        qq[1]:=1; dp[1]:=1;
        while l<r do begin
                inc(l); u:=qq[l];
                y:=h[u];
                while y>0 do begin
                        v:=e[y].v;
                        if f[u,0]<>v then begin
                                dp[v]:=dp[u]+1;
                                f[v,0]:=u;
                                inc(r); qq[r]:=v;
                        end;
                        y:=e[y].n;
                end;
        end;

        for i:=1 to n do
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
assign(input,'1787.in'); reset(input);
assign(output,'1787.out'); rewrite(output);
        readln(n,m);
        for i:=1 to n-1 do begin
                readln(u,v);
                add(u,v); add(v,u);
        end;
        bfs;

        for i:=1 to m do begin
                readln(a,b,c);
                k:=0;
                p:=lca(a,b); if dp[p]>dp[k] then k:=p;
                p:=lca(a,c); if dp[p]>dp[k] then k:=p;
                p:=lca(b,c); if dp[p]>dp[k] then k:=p;
                q:=lca(p,a);
                writeln(k,' ',dp[a]+dp[b]+dp[c]-dp[q]-dp[q]-dp[k]);
        end;
close(output);
end.
