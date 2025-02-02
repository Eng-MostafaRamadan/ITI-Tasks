# Day 1 Tasks

This repository contains solutions for the Day 1 tasks, focusing on foundational programming concepts such as loops, functions, and conditional statements.

## Task 1: FizzBuzz

Write a program that:
- Prints "Fizz" for numbers divisible by 3.
- Prints "Buzz" for numbers divisible by 5.
- Prints "FizzBuzz" for numbers divisible by both 3 and 5.

The program uses a loop to print numbers from 1 to 20 with the above logic.

### Example Output:
```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
```

---

## Task 2: Check Even or Odd

Create a function `CheckNumber` that:
- Accepts one parameter:
  - `number` (int): The number to check.
- Determines if the number is **even** or **odd**.
- Prints whether the number is even or odd.

### Example Usage:
```python
CheckNumber(4)  # Output: The number 4 is even.
CheckNumber(7)  # Output: The number 7 is odd.
```

---

## Task 3: Calculate Discount

Write a function `calculateDiscount` that:
- Accepts the following named parameters:
  - `originalPrice` (float): The price before the discount.
  - `discountPercent` (float): The percentage discount. Default value is 10%.
- Returns the discounted price.

### Formula:
Discounted Price = Original Price - (Original Price * Discount Percent / 100)

### Example Usage:
```python
calculateDiscount(originalPrice=100.0)  # Output: 90.0 (10% discount by default)
calculateDiscount(originalPrice=200.0, discountPercent=20)  # Output: 160.0
