%Criar Templates
%Letras
A=imread('Templates/A.bmp');B=imread('Templates/B.bmp');
C=imread('Templates/C.bmp');D=imread('Templates/D.bmp');
E=imread('Templates/E.bmp');F=imread('Templates/F.bmp');
G=imread('Templates/G.bmp');H=imread('Templates/H.bmp');
I=imread('Templates/I.bmp');J=imread('Templates/J.bmp');
K=imread('Templates/K.bmp');L=imread('Templates/L.bmp');
M=imread('Templates/M.bmp');N=imread('Templates/N.bmp');
O=imread('Templates/O.bmp');P=imread('Templates/P.bmp');
Q=imread('Templates/Q.bmp');R=imread('Templates/R.bmp');
S=imread('Templates/S.bmp');T=imread('Templates/T.bmp');
U=imread('Templates/U.bmp');V=imread('Templates/V.bmp');
W=imread('Templates/W.bmp');X=imread('Templates/X.bmp');
Y=imread('Templates/Y.bmp');Z=imread('Templates/Z.bmp');
Afill=imread('Templates/fillA.bmp');
Bfill=imread('Templates/fillB.bmp');
Dfill=imread('Templates/fillD.bmp');
Ofill=imread('Templates/fillO.bmp');
Pfill=imread('Templates/fillP.bmp');
Qfill=imread('Templates/fillQ.bmp');
Rfill=imread('Templates/fillR.bmp');




%Numeros
one=imread('Templates/1.bmp');  two=imread('Templates/2.bmp');
three=imread('Templates/3.bmp');four=imread('Templates/4.bmp');
five=imread('Templates/5.bmp'); six=imread('Templates/6.bmp');
seven=imread('Templates/7.bmp');eight=imread('Templates/8.bmp');
nine=imread('Templates/9.bmp'); zero=imread('Templates/0.bmp');
zerofill=imread('Templates/fill0.bmp');
fourfill=imread('Templates/fill4.bmp');
sixfill=imread('Templates/fill6.bmp');
sixfill2=imread('Templates/fill6_2.bmp');
eightfill=imread('Templates/fill8.bmp');
ninefill=imread('Templates/fill9.bmp');
ninefill2=imread('Templates/fill9_2.bmp');




%*-*-*-*-*-*-*-*-*-*-*-
letra=[A Afill B Bfill C D Dfill E F G H I J K L M...
    N O Ofill P Pfill Q Qfill R Rfill S T U V W X Y Z];

numero=[one two three four fourfill five...
    six sixfill sixfill2 seven eight eightfill nine ninefill ninefill2 zero zerofill];

caracter=[letra numero];

NovoTemplate=mat2cell(caracter,42,[24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24]);






save ('NovoTemplate','NovoTemplate')
clear all