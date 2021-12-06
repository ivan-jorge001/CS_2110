# Multidimensional Arrays

Type: Quiz 4 Material

## Marginally Indexed Arrays

```c
char *month_name(int n) {
	static char *name[] = {
		"Illegal month",
		"January", "February", "March",
		"April", "May", "June",
		"July", "August", "September",
		"Octoober", "November", "December"
	}
	return (n < 1 || n > 12) ? name[0] : name[n];
}
```

name is stored in a static area memory since static keyword is used. Th

![Screen Shot 2021-12-01 at 01.44.36.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_01.44.36.png)

## Multi-Dimensional Array

![Screen Shot 2021-12-01 at 01.49.41.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_01.49.41.png)

![Screen Shot 2021-12-01 at 01.49.54.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_01.49.54.png)

- Visualization of Indexing into an Array
    
    ![Screen Shot 2021-12-01 at 01.52.35.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_01.52.35.png)
    

```c
#include <stdio.h>
#include <stdlib.h>
int main() {
	int a[5][7];
	printf("sizeof a = %d\n", sizeof a); //140
	printf("sizeof a[3] = %d\n", sizeof a[3]); //28
	printf("sizeof a[3][4] = %d\n", sizeof a[3][4]); //4
	return EXIT_SUCCESS;
}
//The type of a[3][4] is int(int size is 4)
//The type of a[3] is array[7] of int
//The type of a is array[5] of array[7] of int 
```

- One Dimensional Array
    
    ```c
    //One dimensional array
    int ia[6];
    //Address of the beginning of array:
    ia = &ia[0];
    ```
    
- Two Dimensional Array
    
    ```c
    //Two Dimensional Array
    int ia[3][6];
    //Address of th beginning of array:
    ia = &ia[0][0];
    //Address of row 0
    ia[0] = &ia[0][0];
    //Address of row 1:
    ia[1] = &ia[1][0];
    //Address of row 2:
    ia[2] = &ia[2][0]; 
    ```
    

### Element Access

1. skip over required number of rows:
    
    row_index * sizeof(row)
    
2. plus the address of array gives the address of first element
of desired row
    
    column_index * sizeof(arr_type)
    

## Pointer Calculations on our own

Compute array memory address: Cast the pointer to (char *)

The multiplier applied to arithmetic on that pointer will then
be sizeof(char) == 1

To access element (r, c) in arr:

```c
int arr[5][10];
int offset = (r * 10 + c) * sizeof(int);
int *p = (int *)((char *) arr + offset);
//p points to the address of arr[r][c];
//NOT HOW YOU ACTUALLY WRIT IN C
```

### Multidimensional Array Parameters

Since declaration of 1D arrays don't need to be told the size, we never need the first dimension to declare any array.

*See in-class quiz q3 for more explanation*

```c
void tester(int arr[][4][5], int len)
{ ... }
int main()
{
		//one-dimensional array delcaration, e.g. double q[]
    int ia[3][4][5]; 
		//
    int ib[8][4][5];
    int *ic;
	  //ic = ia; // warning: incompatible type
    ic = &ia[0][0][0];[
    tester(ia, 3);(
    tester(ib, 8);(
    tester((int (*)[4][5])ic, 3;
}
```

## 3D array

![Screen Shot 2021-12-01 at 02.18.18.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_02.18.18.png)

offset = (i * rows * columns) + (j * columns) + k

a[i][j][k] == (*(*(a + i) + j) + k)

- In-class quiz question 1
    
    ![Screen Shot 2021-12-01 at 01.44.55.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_01.44.55.png)
    
    - Answer
        
        D. 
        
- In-class quiz question 2
    
    ![Screen Shot 2021-12-01 at 02.05.05.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_02.05.05.png)
    
    - Answer
        
        ![Screen Shot 2021-12-01 at 02.06.12.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_02.06.12.png)
        
        a is a marginally indexed array
        
        b is a 2-D array
        
- In-class quiz question 3
    
    ![Screen Shot 2021-12-01 at 02.16.54.png](Multidimensional%20Arrays%20eab0f08556774c2e850656212ef0d6a5/Screen_Shot_2021-12-01_at_02.16.54.png)
    
    - Answer
        
        C