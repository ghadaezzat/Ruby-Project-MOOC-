#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<ctype.h>
int main()
{
char ar[20]={0};
int ch , che, sp , end=0 ,now ;
int v=0;

clrscr();


do{//open do
	ch=getch();
	sp=isprint(ch);

		if(sp!=0){ //normal
			if(v<20){
				gotoxy(v+1,1);
				printf("%c",ch);
				ar[v]=ch;


				//if(sp!=0){
				//che=getch();
				//if (ch=75)
				//{end=strlen(v);
				//}
				//v=end;


				v++;
				if(v>end) {
				//end++;
				}
				now++;
				}
		}
		 else
		 {
		 if (ch==13){
		 gotoxy(12,12) ;
		 printf("%s",ar);}

		  // else
		//{ //nonprin inded

		      else  if(ch==0){

				che=getch();
				   switch(che){

					case 77: // case right
					       v++;

					       if(v>19){
						    v=0;
					       }
					break;



					case 75://case left
						   v--;

						   if(v<0){
						    v=19;
						   }

					break;

					case 71: //home

					      v=0;
					break;


					case 79://end

						  end=strlen(ar);
						  v=end;


					break;


					case 13:
					      gotoxy(12,12);

					      printf("%s",ar);
					break;

				}
				gotoxy(v+1,1);

				}



			}

		}while(ch!=27);
return 0 ;
}
