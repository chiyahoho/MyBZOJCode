//POI2007]�칫¥biu
var
        i,y,n,m,u,v,l,r,et,ans:longint;
        nt,pr,h,q,a:array[0..200000]of longint;
        vis:array[0..200000]of boolean;
        e:array[0..5000000]of record v,n:longint; end;

procedure add(u,v:longint);
begin
        inc(et);
        e[et].v:=v;
        e[et].n:=h[u];
        h[u]:=et;
end;

begin
assign(input,'1098.in'); reset(input);
assign(output,'1098.out'); rewrite(output);
        readln(n,m);
        for i:=1 to m do begin
                readln(u,v);
                add(u,v); add(v,u);
        end;
        for i:=0 to n+1 do begin nt[i]:=i+1; pr[i]:=i-1; end;
        while nt[0]<=n do begin
                l:=0; r:=1; q[1]:=nt[0];
                nt[0]:=nt[q[1]];
                pr[nt[q[1]]]:=0;
                while l<r do begin
                        inc(l);
                        u:=q[l]; y:=h[u];
                        while y>0 do begin
                                vis[e[y].v]:=true;
                                y:=e[y].n;
                        end;
                        v:=nt[0];
                        while v<=n do begin
                                if not vis[v] then begin
                                        inc(r); q[r]:=v;
                                        nt[pr[v]]:=nt[v];
                                        pr[nt[v]]:=pr[v];
                                end;
                                v:=nt[v];
                        end;
                        v:=nt[0];
                        while v<=n do begin vis[v]:=false; v:=nt[v]; end;
                end;
                inc(ans); inc(a[r]);
        end;
        writeln(ans);
        for i:=1 to n do for v:=1 to a[i] do write(i,' ');
close(output);
end.
