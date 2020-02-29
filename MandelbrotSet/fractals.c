#include <stdio.h>
const int maxLoops = 100;

int main(){
  FILE *fp;
  fp=fopen("test.txt", "w");
  if(fp == NULL)
      return 1;

  int x = 0;
  double zr, zc, znr, znc, znrn, zncn;

  for (double y = -1; y <= 1; y+=0.004) {
    if (x%100 == 0){
      printf("%d\n", x/100);
    }
    for (double x = -1; x <= 1; x+=0.004) {
      zr = x;
      zc = y;
      znr = x;
      znc = y;

      int i = 0;
      while (i < maxLoops && (znr*znr + znc*znc) < 10){
        znrn = znr*znr - znc*znc + zr;
        zncn = 2 * znr * znc + zc;
        znr = znrn;
        znc = zncn;
        i++;
      }
      if (i>=100){
        fprintf(fp, "%d", 9);
      } else {
        fprintf(fp, "%d", 0);
      }
    }
    x++;
    fprintf(fp, "\n");
  }


  fclose(fp);
  return 0;
}
