//Ahoi2009]Mincut ×îÐ¡¸î
const   oo=maxlongint; maxN=10000; maxE=100000;
var
        et,ss,tt,n,m,cc,tot,u,v,l,y,i:longint;
        ans:array[0..maxN,1..2]of longint;
        e:array[-maxE..maxE]of record v,n,l:longint; end;
        g,vg,h,q,low,dfn,po:array[0..maxN]of longint;
        vis,f:array[0..maxN]of boolean;

function min(a,b:longint):longint;
begin if a>b then exit(b); exit(a); end;

procedure add(u,v,l:longint);
begin
        inc(et);
        e[et].v:=v; e[-et].v:=u;
        e[et].l:=l; e[-et].l:=0;
        e[et].n:=h[u]; e[-et].n:=h[v];
        h[u]:=et; h[v]:=-et;
end;

function sap(u,flow:longint):longint;
var     y,ff:longint;
begin
        if u=tt then exit(flow);
        sap:=0;
        y:=h[u];
        while y<>0 do begin
                if (e[y].l>0)and(g[u]=g[e[y].v]+1) then begin
                        ff:=sap(e[y].v,min(flow-sap,e[y].l));
                        inc(sap,ff);
                        dec(e[y].l,ff); inc(e[-y].l,ff);
                        if sap=flow then exit;
                end;
                y:=e[y].n;
        end;
        if g[ss]=n then exit;
        dec(vg[g[u]]); if vg[g[u]]=0 then g[ss]:=n;
        inc(g[u]); inc(vg[g[u]]);
end;

procedure tarjan(u:longint);
var     y,v:longint;
begin
        inc(cc);
        low[u]:=cc; dfn[u]:=cc;
        vis[u]:=true; f[u]:=true;
        inc(tot); q[tot]:=u;
        y:=h[u];
        while y<>0 do begin
                if e[y].l>0 then begin
                        v:=e[y].v;
                        if not vis[v] then begin
                                tarjan(v);
                                low[u]:=min(low[v],low[u]);
                        end
                        else if f[v] then low[u]:=min(dfn[v],low[u]);
                end;
                y:=e[y].n;
        end;

        if dfn[u]=low[u] then repeat
                v:=q[tot]; dec(tot);
                f[v]:=false;
                po[v]:=u;
        until u=v;
end;

begin
assign(input,'1797.in'); reset(input);
assign(output,'1797.out'); rewrite(output);
        readln(n,m,ss,tt);
        for i:=1 to m do begin
                readln(u,v,l);
                add(u,v,l);
        end;
        g[ss]:=1; vg[1]:=1; vg[0]:=oo;
        while g[ss]<n do sap(ss,oo);
        for i:=1 to n do if not vis[i] then tarjan(i);

        for u:=1 to n do begin
                y:=h[u];
                while y<>0 do begin
                        if (y>0)and(e[y].l=0) then begin
                                v:=e[y].v;
                                if po[u]<>po[v] then begin
                                        ans[y,1]:=1;
                                        if ( (po[u]=po[ss])and(po[v]=po[tt]) )or( (po[v]=po[ss])and(po[u]=po[tt]) ) then ans[y,2]:=1;
                                end;
                        end;
                        y:=e[y].n;
                end;
        end;

        for i:=1 to m do writeln(ans[i,1],' ',ans[i,2]);
close(output);
end.
