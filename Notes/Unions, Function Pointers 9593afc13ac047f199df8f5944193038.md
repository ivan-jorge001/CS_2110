# Unions, Function Pointers

Type: Quiz 4 Material

# Unions

Union is a user-defined datatype. It is a collection of variables of different data types in the same memory location. 

```c
union {
	int myint;
	char mychar;
	char mystr[20];
} myun;

```

*Looks like a struct, and the access is the same as a struct
The difference is that all the members have an offset of zero*

**Unions may:**

- Be copied or assigned
- have their address taken with &
- have their members accessed
- be passed as arguments to functions
- be returned from functions
- be initialized (but only the first member)

**Unions may not:**

- Be compared
- Structure vs Union
    
    ![Screen Shot 2021-12-01 at 13.26.40.png](Unions,%20Function%20Pointers%209593afc13ac047f199df8f5944193038/Screen_Shot_2021-12-01_at_13.26.40.png)
    

## Unions in memory with example above

![Screen Shot 2021-11-29 at 13.20.52.png](Unions,%20Function%20Pointers%209593afc13ac047f199df8f5944193038/Screen_Shot_2021-11-29_at_13.20.52.png)

```c
&myun.myint == &myun.mychar == &myun.mystr[0]
sizeof(myun) == sizeof("Largest member")
```

![Screen Shot 2021-11-29 at 13.25.26.png](Unions,%20Function%20Pointers%209593afc13ac047f199df8f5944193038/Screen_Shot_2021-11-29_at_13.25.26.png)

## raison d'être

Union is often used in implementing polymorphism found in OOP

Store information about aletes

- Information:
    
    ![Screen Shot 2021-11-29 at 13.27.29.png](Unions,%20Function%20Pointers%209593afc13ac047f199df8f5944193038/Screen_Shot_2021-11-29_at_13.27.29.png)
    

```c
struct player {
	char name[20];
	char jerseynum[4];
	char team[20];
	int player_type;
	union sport {
		struct football {...} footbstats;
		struct baseball {...} basebstats;
		struct baseketball {...} baskbstats;
		} thesport;
} theplayer;
theplayer.thesport.footbstats.tds = 3;
```

# Function Pointers

```c
int fi(void) 
/* Function that returns an int*/
int *fpi(void) 
/* Function that returns a pointer to an int*/
int (*pfi) (void) 
/* pfi is a pointer to a function returning int*/
pfi = fi; 
/*Legal assigment*/
/*Funciton name without () is the memory address*/
pfi = fi(); 
/*NO! BAD!*/
/*fi() is a pointer to an int*/
```

## QSort()

- Properties
    
    ```c
    NAME
    	qsort - sort an array
    ANSI_SYNOPSIS
    	#include <stdlib.h>
    	void qsort(void *base, size_t nmemb, size_t size, 
    		int(* compare)(const void *, const void *));
    RETURNS
    	qsort does not return a result.
    PORTABILITY
    	qsort is required by ANSI(without specifying the sorting algorithm)
    SOURCE
    	src/newlib/libc/stdlib/qsort/c
    ```
    
- Description
    
    qort sorts an array (beginning at base) of nmemb objects.
    
    size describes the size of each element of the array.
    
    You must supply a pointer to a comparison function,  using
    
    the argument is shown as compare.   (This  permits sorting
    
    objects of  unknown  properties.)  Define the comparison
    
    function to accept two arguments, each a pointer to an
    
    element of the array starting at base.  The  result  of
    
    (*<[compar)>>  must  be negative if the first argument is
    
    less than the second, zero if the two arguments match, and
    
    positive if the first argument is greater than the second
    
    (where ``less than'' and ``greater than'' refer to what-
    
    ever arbitrary ordering is appropriate).
    
    The array is sorted in place; that is when qsort returns,
    
    the array elements beginning at base have been reordered.
    
- Declaration
    
    ```c
    #include <stdlib.h>
    void qsort(
    	void * base,
    	size_t nmemb,
    	size_t size,
    	int (* compar) (const void *, const void *)
    )
    /*the result of "compar" must be negative if the firs argument is less than the second, 
    	zero if the two arguments match, and positive if the first argument is greater than the second
    	(where "less than" and "greater than" refer to whatever arbitrary ordering is appropriate)*/
    ```
    
- Demo
    
    ```c
    #include <studio.h>
    #include <stdlib.h>
    #define MAX 100
    int compar_ints(const void *pa, const void *pb) {
    	return *((int *) pa) - *((int *) pb);
    }
    int compar_strings(const void *ppa, const void *ppb) {
    	return strcmp(*((char **)ppa) , *((char **) ppb)); 
    }
    ```
    
    ```c
    #define MAX 100
    int main (int argc, char **argv) {
    	char *strings[] = {"dec", "sum", "IBM", "apple", "hp", "ti", "univac"};
    	int i, s;
    	int a[MAX];
    	if (argc == 2 && *(argv[1] == 'a')) {
    		s = sizeof(strings) / sizeof(strings[0]);
    		qsort(strings, s, sizeof(strings[0]), compar_strings);
    		for (i = 0; i < s; i++) {
    			printf(" %s", strings[i]);
    		}
    		print("\n");
    	}
    	else {
    		for (i = 0; i < MAX; i++) {
    			a[i] = rand() % 100;
    			print(" %d", a[i]);
    		}
    		printf("\n\n");
    		qsort(a, MAX, sizeof(int), compar_ints);
    		for (i = 0; i < MAX; i++) {
    			printf(" %d", a[i]);
    		}
    	}
    	return 0;
    }
    ```
    

# Question

- In-class question 1
    
    ![Screen Shot 2021-11-29 at 14.01.44.png](Unions,%20Function%20Pointers%209593afc13ac047f199df8f5944193038/Screen_Shot_2021-11-29_at_14.01.44.png)
    
- In-class question 2
    
    ![Screen Shot 2021-11-29 at 14.02.31.png](Unions,%20Function%20Pointers%209593afc13ac047f199df8f5944193038/Screen_Shot_2021-11-29_at_14.02.31.png)