//HAOI2006]ÊÜ»¶Ó­µÄÅ£
var
        n,m,i,u,v,y,pp,ans,cc,et,top:longint;
        h,dfn,low,q,po:array[0..50000]of longint;
        f,vis,ru:array[0..50000]of boolean;
        e:array[0..100000]of record v,n:longint; end;

function min(a,b:longint):longint;
begin if a>b then exit(b); exit(a); end;

procedure add(u,v:longint);
begin
        inc(et);
        e[et].v:=v;
        e[et].n:=h[u];
        h[u]:=et;
end;

procedure tarjan(u:longint);
var     y,v:longint;
begin
        inc(cc);
        low[u]:=cc; dfn[u]:=cc;
        vis[u]:=true; f[u]:=true;
        inc(top); q[top]:=u;
        y:=h[u];
        while y>0 do begin
                v:=e[y].v;
                if not vis[v] then begin
                        tarjan(v);
                        low[u]:=min(low[u],low[v]);
                end
                else if f[v] then low[u]:=min(low[u],dfn[v]);
                y:=e[y].n;
        end;

        if dfn[u]=low[u] then repeat
                v:=q[top]; dec(top);
                f[v]:=false;
                po[v]:=u;
        until v=u;
end;

begin
assign(input,'1051.in'); reset(input);
assign(output,'1051.out'); rewrite(output);
        readln(n,m);
        for i:=1 to m do begin
                readln(u,v);
                add(v,u);
        end;
        for i:=1 to n do if not vis[i] then tarjan(i);

        for u:=1 to n do begin
                y:=h[u];
                while y>0 do begin
                        if po[u]<>po[e[y].v] then ru[po[e[y].v]]:=true;
                        y:=e[y].n;
                end;
        end;

        for i:=1 to n do if (po[i]=i)and(not ru[i]) then begin
                if pp<>0 then begin writeln(0); close(output); halt; end;
                pp:=i;
        end;

        for i:=1 to n do if po[i]=pp then inc(ans);
        writeln(ans);
close(output);
end.