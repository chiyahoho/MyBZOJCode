//CQOI2007]ÓàÊıÖ®ºÍsum
var
        n,k,l,r,a,ans:int64;
begin
assign(input,'1257.in'); reset(input);
assign(output,'1257.out'); rewrite(output);
        readln(n,k);
        l:=1;
        while l<=n do begin
                a:=k div l;
                if a=0 then r:=n else r:=k div a;
                if r>n then r:=n;
                ans:=ans+k*(r-l+1)-a*(l+r)*(r-l+1) div 2;
                l:=r+1;
        end;
        writeln(ans);
close(output);
end.