//AHOI2006]上学路线route
const   oo=maxlongint>>1;
var
        et,u,v,l,c,i,n,m,ans:longint;
        g,vg,d,h:array[0..10000]of longint;
        q:array[0..1000000]of longint;
        iq:array[0..10000]of boolean;
        bo:array[-1000000..1000000]of boolean;
        e:array[-1000000..1000000]of record v,n,l,c:longint; end;

function min(a,b:longint):longint;
begin if a>b then exit(b); exit(a); end;

procedure add(u,v,l,c:longint);
begin
        e[et].v:=v; e[-et].v:=u;
        e[et].l:=l; e[-et].l:=l;
        e[et].c:=c; e[-et].c:=c;
        e[et].n:=h[u]; e[-et].n:=h[v];
        h[u]:=et; h[v]:=-et;
end;

procedure spfa;
var     i,l,r,y,v:longint;
begin
        for i:=2 to n do d[i]:=oo;
        l:=0; r:=1; q[1]:=1;
        while l<r do begin
                inc(l); u:=q[l];
                y:=h[u]; iq[u]:=false;
                while y<>0 do begin
                        v:=e[y].v;
                        if d[u]+e[y].l<d[v] then begin
                                d[v]:=d[u]+e[y].l;
                                if not iq[v] then begin
                                        inc(r); q[r]:=v;
                                        iq[v]:=true;
                                end;
                        end;
                        y:=e[y].n;
                end;
        end;
        writeln(d[n]);
end;

procedure check(u:longint);
var     y:longint;
begin
        y:=h[u];
        while y<>0 do begin
                if d[u]+e[y].l=d[e[y].v] then begin
                        bo[y]:=true;
                        bo[-y]:=true; e[-y].c:=0;
                end;
                y:=e[y].n;
        end;
end;

function sap(u,flow:longint):longint;
var     y,ff:longint;
begin
        if u=n then exit(flow);
        sap:=0;
        y:=h[u];
        while y<>0 do begin
                if bo[y] and(e[y].c>0)and(g[u]=g[e[y].v]+1) then begin
                        ff:=sap(e[y].v,min(flow-sap,e[y].c));
                        inc(sap,ff);
                        dec(e[y].c,ff); inc(e[-y].c,ff);
                        if sap=flow then exit;
                end;
                y:=e[y].n;
        end;

        if g[1]=n then exit;
        dec(vg[g[u]]); if vg[g[u]]=0 then g[1]:=n;
        inc(g[u]); inc(vg[g[u]]);
end;

begin
assign(input,'1266.in'); reset(input);
assign(output,'1266.out'); rewrite(output);
        readln(n,m);
        for et:=1 to m do begin
                readln(u,v,l,c);
                add(u,v,l,c);
        end;
        spfa;
        for i:=1 to n do check(i);

        g[1]:=1; vg[1]:=1; vg[0]:=oo;
        while g[1]<n do inc(ans,sap(1,oo));
        writeln(ans);
close(output);
end.
