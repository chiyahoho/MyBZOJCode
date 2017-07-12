//SCOI2011]лг╧Ш
var
        ans:int64;
        et,n,m,i,x,a,b:longint;
        h,q,d,t:array[0..200000]of longint;
        f:array[0..200000]of boolean;
        e:array[0..500000]of record v,n,l:longint; end;

procedure add(u,v,l:longint);
begin
        inc(et);
        e[et].v:=v;
        e[et].l:=l;
        e[et].n:=h[u];
        h[u]:=et;
end;

procedure spfa;
var     l,r,u,v,y,i:longint;
begin
        l:=0; r:=n;
        for i:=1 to n do begin
                d[i]:=1;
                q[i]:=i;
                f[i]:=true;
        end;
        while l<>r do begin
                l:=(l mod n)+1;
                u:=q[l]; f[u]:=false;
                y:=h[u];
                while y<>0 do begin
                        v:=e[y].v;
                        if d[u]+e[y].l>d[v] then begin
                                d[v]:=d[u]+e[y].l;
                                if not f[v] then begin
                                        inc(t[v]);
                                        r:=(r mod n)+1;
                                        q[r]:=v;
                                        f[v]:=true;
                                        if t[v]=n then begin
                                                writeln(-1);
                                                exit;
                                        end;
                                end;
                        end;
                        y:=e[y].n;
                end;
        end;
        for i:=1 to n do ans:=ans+d[i];
        writeln(ans);
end;

begin
assign(input,'2330.in'); reset(input);
assign(output,'2330.out'); rewrite(output);
        readln(n,m);
        for i:=1 to m do begin
                readln(x,a,b);
                if (a=b)and((x=2)or(x=4)) then begin writeln(-1); halt; end;
                if x=1 then begin add(a,b,0); add(b,a,0); end
                else if x=2 then add(a,b,1)
                else if x=3 then add(b,a,0)
                else if x=4 then add(b,a,1)
                else if x=5 then add(a,b,0);
        end;
        spfa;
close(output);
end.
