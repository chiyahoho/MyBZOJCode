//[ZJOI2008]�t����
const oo=100000000000; zero=0.0000000001;
type point=record x,y:extended; end;
var
      ans:extended;
      m,mm,i,j,n:longint;
      z,ba,bb:array[0..10000]of point;
      dd,k:point;
function cross(a,b,p,q:point):extended;
begin cross:=(b.x-a.x)*(q.y-p.y)-(b.y-a.y)*(q.x-p.x); end;
function min(a,b:extended):extended;
begin if a>b then exit(b); exit(a); end;

function jiao(a,b,p,q:point):boolean;                          //ֱ���ཻ��l1=a��b,l2=p��q
var   t,k:extended;
begin
      k:=cross(a,b,p,q);
      if (-zero<k)and(k<zero) then exit(false);
      t:=cross(a,p,p,q)/k;
      dd.x:=a.x+(b.x-a.x)*t;                                   //dd�ǽ���
      dd.y:=a.y+(b.y-a.y)*t;
      if (zero<t)and(t<1-zero) then exit(true); exit(false);     //�ж��Ƿ��ཻ����������ڶ˵㿴����ֻ����t=0��t=1�㲻�㡣�����жϵ���l2����ֱ����l1�߶��Ƿ��ཻ�������߽�Ϊ�߶ο��Է�����
end;

begin
assign(input,'1038.in'); reset(input);
assign(output,'1038.out'); rewrite(output);
      readln(n); ans:=oo;
      for i:=1 to n do read(z[i].x); readln;
      for i:=1 to n do read(z[i].y); readln;
      m:=4;
      ba[1].x:=z[1].x; ba[1].y:=-oo;                   //�ȸ��һ��������İ�
      ba[2].x:=z[1].x; ba[2].y:=oo;
      ba[3].x:=z[n].x; ba[3].y:=oo;
      ba[4].x:=z[n].x; ba[4].y:=-oo;
      for i:=1 to n-1 do begin                         //��ƽ�潻��ʼ
            mm:=0; ba[m+1]:=ba[1];
            for j:=1 to m do begin
                  if cross(z[i],z[i+1],z[i],ba[j])>-zero then
                  begin inc(mm); bb[mm]:=ba[j]; end;
                  if jiao(ba[j],ba[j+1],z[i],z[i+1]) then
                  begin inc(mm); bb[mm]:=dd; end;
            end;
            m:=mm; for j:=1 to m do ba[j]:=bb[j];
      end;
//----------------------------------------------------------��ƽ�潻��ɣ����治�ÿ���
      ba[m+1]:=ba[1];
      for i:=1 to n do begin
            k.x:=z[i].x; k.y:=z[i].y+1;
            for j:=1 to m do if jiao(ba[j],ba[j+1],z[i],k) then
            ans:=min(ans,dd.y-z[i].y);
      end;
      for j:=1 to m do
      for i:=1 to n-1 do if (z[i].x<=ba[j].x)and(ba[j].x<=z[i+1].x) then begin
            k.x:=ba[j].x; k.y:=ba[j].y-1;
            jiao(z[i],z[i+1],ba[j],k);
            ans:=min(ans,ba[j].y-dd.y);
      end;
      if (-zero<ans)and(ans<zero) then ans:=0;
      writeln(ans:0:3);
close(output);
end.