//Usaco2007 Open]Dingin吃饭
//这只是个尝试的前奏
//这不科学！虽然wa但不可能T吧
//前奏，先交交看吧
//初步修改版本出世
//什么样的优化才是最开怀——当前弧
const oo=maxlongint;
var
  u,ans,i,et,ss,tt,j,n1,n2,n3,c1,c3:longint;
  g,vg,h,y:array[0..3000]of longint;
  e:array[-500000..500000]of record v,l,n,b:longint; end;

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
var     ff:longint;
begin
        if u=tt then exit(flow);
        sap:=0;
        while y[u]<>0 do begin
                if (g[u]=g[e[y[u]].v]+1)and(e[y[u]].l>0) then begin
                        ff:=sap(e[y[u]].v,min(flow-sap,e[y[u]].l));
                        inc(sap,ff);
                        dec(e[y[u]].l,ff);
                        inc(e[-y[u]].l,ff);
                        if sap=flow then exit;
                end;
                y[u]:=e[y[u]].n;
        end;
        if g[ss]=tt then exit;
        dec(vg[g[u]]); if vg[g[u]]=0 then g[ss]:=tt;
        inc(g[u]); inc(vg[g[u]]);
        y[u]:=h[u];
end;
begin
        readln(n2,n1,n3);
        ss:=0; tt:=n1+n2+n2+n3+1;
        for i:=1 to n2 do begin
                read(c1,c3);
                for j:=1 to c1 do begin read(u); add(u,i+n1,1); end;
                for j:=1 to c3 do begin read(u); add(i+n1+n2,u+n1+n2+n2,1); end;
                readln;
        end;
        for i:=1 to n1 do add(0,i,1);
        for i:=n1+n2+n2+1 to n1+n2+n2+n3 do add(i,tt,1);
        for i:=n1+1 to n1+n2 do add(i,i+n2,1);
        for i:=0 to tt do y[i]:=h[i];
        g[0]:=1; vg[1]:=1; vg[0]:=oo;
        while g[0]<tt do inc(ans,sap(0,oo));
        writeln(ans);
end.
