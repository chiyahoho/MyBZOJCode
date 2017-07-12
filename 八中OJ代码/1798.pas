//Ahoi2009]Seq Œ¨ª§–Ú¡–seq
var
        ans,mo:int64;
        a,b,n,m,i,c,ca:longint;
        aa,tr,ch,ja:array[0..900000]of int64;
        ll,rr:array[0..900000]of longint;

procedure pass(p:longint);
begin
        if ch[p]<>1 then begin
                ch[p*2]:=(ch[p*2]*ch[p])mod mo;
                ja[p*2]:=(ja[p*2]*ch[p])mod mo;
                ch[p*2+1]:=(ch[p*2+1]*ch[p])mod mo;
                ja[p*2+1]:=(ja[p*2+1]*ch[p])mod mo;
                tr[p]:=(tr[p]*ch[p])mod mo;
                ch[p]:=1;
        end;
        if ja[p]>0 then begin
                ja[p*2]:=(ja[p*2]+ja[p])mod mo;
                ja[p*2+1]:=(ja[p*2+1]+ja[p])mod mo;
                tr[p]:=(tr[p]+ja[p]*(rr[p]-ll[p]+1))mod mo;
                ja[p]:=0;
        end;
end;

procedure tget(p:longint);
begin
        if ll[p]=rr[p] then exit;
        pass(p*2); pass(p*2+1);
        tr[p]:=(tr[p*2]+tr[p*2+1])mod mo;
end;

procedure build(p,l,r:longint);
var     mi:longint;
begin
        ll[p]:=l; rr[p]:=r; ch[p]:=1;
        if l=r then begin tr[p]:=aa[l]; exit; end;
        mi:=(l+r)>>1;
        build(p*2,l,mi); build(p*2+1,mi+1,r);
        tr[p]:=(tr[p*2]+tr[p*2+1])mod mo;
end;

procedure insert(p,a,b,ca,c:longint);
var     mi:longint;
begin
        pass(p);
        if (a=ll[p])and(b=rr[p]) then begin
                if ca=1 then ch[p]:=c else ja[p]:=c;
                exit;
        end;
        mi:=(ll[p]+rr[p])>>1;
        if b<=mi then insert(p*2,a,b,ca,c)
        else if a>mi then insert(p*2+1,a,b,ca,c)
        else begin
                insert(p*2,a,mi,ca,c);
                insert(p*2+1,mi+1,b,ca,c);
        end;
        tget(p);
end;

procedure get(p,a,b:longint);
var     mi:longint;
begin
        pass(p);
        if (a=ll[p])and(b=rr[p]) then begin
                ans:=(ans+tr[p])mod mo;
                exit;
        end;
        mi:=(ll[p]+rr[p])>>1;
        if b<=mi then get(p*2,a,b)
        else if a>mi then get(p*2+1,a,b)
        else begin
                get(p*2,a,mi);
                get(p*2+1,mi+1,b);
        end;
end;

begin
assign(input,'1798.in'); reset(input);
assign(output,'1798.out'); rewrite(output);
        readln(n,mo);
        for i:=1 to n do read(aa[i]);
        build(1,1,n);
        readln(m);
        for i:=1 to m do begin
                read(ca,a,b);
                if (ca=1)or(ca=2) then begin
                        readln(c); c:=c mod mo;
                        insert(1,a,b,ca,c);
                end
                else begin
                        readln;
                        ans:=0;
                        get(1,a,b);
                        writeln(ans);
                end;
        end;
close(output);
end.
