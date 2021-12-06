# Base Conversions

Type: Quiz 1 Material

# Notes

## Conversions

### Binary to Decimal

**[Online Converter](https://www.w3resource.com/convert/number/binary-to-decimal.php)**

Visual Representation:

| Decimal | Binary | Arithmetic |
| --- | --- | --- |
| 0 | 0000 | 0+0+0+0 |
| 1 | 0001 | 0+0+0+1 |
| 2 | 0010 | 0+0+2+0 |
| 3 | 0011 | 0+0+2+1 |
| 4 | 0100 | 0+4+0+0 |
| 5 | 0101 | 0+4+0+1 |
| 6 | 0110 | 0+4+2+0 |
| 7 | 0111 | 0+4+2+1 |
| 8 | 1000 | 8+0+0+0 |
| 9 | 1001 | 8+0+0+1 |
| 10 | 1010 | 8+0+2+0 |
| 11 | 1011 | 8+0+2+1 |
| 12 | 1100 | 8+4+0+0 |
| 13 | 1101 | 8+4+0+1 |
| 14 | 1110 | 8+4+2+0 |
| 15 | 1111 | 8+4+2+1 |

**0b**010101110 is sometimes used for binary, but is not standard in Java and C

```java
// Does not include negative numbers
public static int binaryStringToInt(String binary) {
    int output = 0;
    for (int i = 0; i < binary.length(); i++) {
        if (binary.charAt(i) == '1') {
            output += 1 << binary.length() - i - 1;
        }
    }
    return output;
}
```

### Binary to Octal

[Online Converter](https://www.w3resource.com/convert/number/binary-to-octal.php)

Diagram:

| Base 2 | 000 | 111 | 010 | 100 | 101 |
| --- | --- | --- | --- | --- | --- |
| Base 8 | 0 | 7 | 2 | 4 | 5 |

```java
public static String binaryStringToOctalString(String binary) {
    int decimal = 0;
    for (int i = 0; i < binary.length(); i++) {
        if (binary.charAt(i) == '1') {
            decimal += 1 << binary.length() - i - 1;
        }
    }

    String output = "";
    int counter = 21;
    for (int i = 7; i >= 0; --i) {
        output += (decimal >> counter) & 0b111;
        counter -= 3;
    }
    return output;
```

### Binary to Hexadecimal

[Online Converter](https://www.w3resource.com/convert/number/binary-to-hex.php)

Diagram:

| Base 2 | 1000 | 1111 | 0011 | 1100 | 0001 |
| --- | --- | --- | --- | --- | --- |
| Base 8 | 8 | F | 3 | C | 1 |

---

### Decimal to Binary

[Online Converter](https://www.w3resource.com/convert/number/decimal-to-binary.php)

### Decimal to Octal

[Online Converter](https://www.w3resource.com/convert/number/decimal-to-octal.php)

### Decimal to Hexadecimal

[Online Converter](https://www.w3resource.com/convert/number/decimal-to-hex.php)

```java
public static String intToHexString(int hex) {
    String output = "";
    int counter = 16;
    while (counter <= hex) {
        counter = counter << 4;
    }
    counter = counter >> 4;
    int counter2 = 0;
    while (counter != 0) {
        if (hex < counter) {
            if (counter2 > 9) {
                output += (char)(counter2 + 65 - 10);
            } else {
                output += counter2;
            }
            counter = counter >> 4;
            counter2 = 0;
        }
        hex -= counter;
        counter2++;
    }
    return output;
}
```

---

### Octal to Binary

[Online Converter](https://www.w3resource.com/convert/number/octal-to-binary.php)

| Base 8 | 6 | 4 | 3 | 0 | 2 |
| --- | --- | --- | --- | --- | --- |
| Base 2 | 110 | 100 | 011 | 000 | 010 |

**0**456 is octal

### Octal to Decimal

[Online Converter](https://www.w3resource.com/convert/number/octal-to-decimal.php)

```java
public static int octalStringToInt(String octal) {
     int output = 0, counter = 0;
     for (int i = octal.length() - 1; i > -1; i--) {
         output += (octal.charAt(i) - 48) << counter;
         counter += 3;
     }
     return output;
 }
```

### Octal to Hexadecimal

[Online Converter](https://www.w3resource.com/convert/number/octal-to-hex.php)

---

### Hexadecimal to Binary

[Online Converter](https://www.w3resource.com/convert/number/hex-to-binary.php)

Diagram Example:

| Base 16 | F | 0 | 0 | D | 5 |
| --- | --- | --- | --- | --- | --- |
| Base 2 | 1111 | 0000 | 0000 | 1101 | 0101 |

**0x**456 is hexadecimal

### Hexadecimal to Decimal

[Online Converter](https://www.w3resource.com/convert/number/hex-to-decimal.php)

### Hexadecimal to Octal

[Online Converter](https://www.w3resource.com/convert/number/hex-to-octal.php)

---

### Bonus Info

Converting base 10 string to int:

```java
public static int decimalStringToInt(String decimal) {
    int output = 0, counter = 1;
    for (int i = decimal.length() - 1; i > -1; i--) {
        output += (decimal.charAt(i) - 48) * counter;
        counter *= 10;
    }
    return output;
}
```

## Powers of 2

| 2^n | literal value |
| --- | --- |
| 2^0 | 1 |
| 2^1 | 2 |
| 2^2 | 4 |
| 2^3 | 8 |
| 2^4 | 16 |
| 2^5 | 32 |
| 2^6 | 64 |
| 2^7 | 128 |
| 2^8 | 256 |
| 2^9 | 512 |
| 2^10 | 1024 |
| 2^11 | 2048 |
| 2^12 | 4096 |
| 2^13 | 8192 |
| 2^14 | 16384 |
| 2^15 | 32768 |
| 2^16 | 65536 |

# Questions & Answers

**How many different numbers can be represented by n bits?**

2^n

**What are the tricks to doing conversions in between binary/octal/hexadecimal (larger numbers) quickly?**