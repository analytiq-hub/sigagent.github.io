---
layout: page
title: Markdown Test Page
mathjax: true
---

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

## Text Formatting

This is a paragraph with **bold text**, *italic text*, and ***bold italic text***.

You can also use __bold__ and _italic_ formatting.

Here's some ~~strikethrough text~~.

Here's some `inline code` in a sentence.

Here's a paragraph with a line break.  
This line appears after a line break.

## Lists

### Unordered Lists
- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
    - Deeply nested item 2.2.1
- Item 3

### Ordered Lists
1. First item
2. Second item
   1. Nested item 2.1
   2. Nested item 2.2
      1. Deeply nested item 2.2.1
3. Third item

### Mixed Lists
1. Ordered item
   - Unordered nested item
   - Another unordered nested item
2. Another ordered item

## Links and Images

[Link to Google](https://www.google.com)

[Link with title](https://www.google.com "Google Homepage")

[Internal link](/about)

[Reference link][1]

[1]: https://www.example.com "Example Website"

Auto-link: https://www.github.com

## Code Blocks

### Inline Code
Use `git status` to check repository status.

### Fenced Code Blocks

```javascript
// JavaScript example
function greet(name) {
    console.log(`Hello, ${name}!`);
}

const fibonacci = (n) => {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
};

greet("World");
console.log(fibonacci(10));
```

```python
# Python example
def fibonacci(n):
    """Calculate fibonacci number recursively"""
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)

print(fibonacci(10))
print(quicksort([3, 6, 8, 10, 1, 2, 1]))
```

```bash
#!/bin/bash
# Bash scripting example
echo "Hello, World!"

# Function to check if a file exists
check_file() {
    if [ -f "$1" ]; then
        echo "File $1 exists"
    else
        echo "File $1 does not exist"
    fi
}

# Loop through arguments
for arg in "$@"; do
    check_file "$arg"
done

ls -la
```

```java
// Java example
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        
        // Fibonacci calculation
        int n = 10;
        System.out.println("Fibonacci(" + n + ") = " + fibonacci(n));
    }
    
    public static int fibonacci(int n) {
        if (n <= 1) return n;
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
    
    // Generic method example
    public static <T> void swap(T[] array, int i, int j) {
        T temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}
```

```c
// C programming example
#include <stdio.h>
#include <stdlib.h>

int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void quicksort(int arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quicksort(arr, low, pi - 1);
        quicksort(arr, pi + 1, high);
    }
}

int partition(int arr[], int low, int high) {
    int pivot = arr[high];
    int i = (low - 1);
    
    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

int main() {
    printf("Hello, World!\n");
    printf("Fibonacci(10) = %d\n", fibonacci(10));
    return 0;
}
```

```cpp
// C++ example
#include <iostream>
#include <vector>
#include <algorithm>

class Calculator {
private:
    double result;
    
public:
    Calculator() : result(0) {}
    
    Calculator& add(double value) {
        result += value;
        return *this;
    }
    
    Calculator& multiply(double value) {
        result *= value;
        return *this;
    }
    
    double getResult() const { return result; }
};

template<typename T>
void quicksort(std::vector<T>& arr, int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quicksort(arr, low, pi - 1);
        quicksort(arr, pi + 1, high);
    }
}

int main() {
    std::cout << "Hello, World!" << std::endl;
    
    Calculator calc;
    double result = calc.add(10).multiply(2).add(5).getResult();
    std::cout << "Result: " << result << std::endl;
    
    return 0;
}
```

```go
// Go example
package main

import (
    "fmt"
    "sort"
)

func fibonacci(n int) int {
    if n <= 1 {
        return n
    }
    return fibonacci(n-1) + fibonacci(n-2)
}

type Person struct {
    Name string
    Age  int
}

func (p Person) String() string {
    return fmt.Sprintf("%s (%d years old)", p.Name, p.Age)
}

func main() {
    fmt.Println("Hello, World!")
    fmt.Printf("Fibonacci(10) = %d\n", fibonacci(10))
    
    people := []Person{
        {"Alice", 30},
        {"Bob", 25},
        {"Charlie", 35},
    }
    
    sort.Slice(people, func(i, j int) bool {
        return people[i].Age < people[j].Age
    })
    
    for _, person := range people {
        fmt.Println(person)
    }
}
```

```rust
// Rust example
fn fibonacci(n: u32) -> u32 {
    match n {
        0 => 0,
        1 => 1,
        _ => fibonacci(n - 1) + fibonacci(n - 2),
    }
}

#[derive(Debug)]
struct Person {
    name: String,
    age: u32,
}

impl Person {
    fn new(name: &str, age: u32) -> Self {
        Person {
            name: name.to_string(),
            age,
        }
    }
    
    fn greet(&self) {
        println!("Hello, I'm {} and I'm {} years old", self.name, self.age);
    }
}

fn main() {
    println!("Hello, World!");
    println!("Fibonacci(10) = {}", fibonacci(10));
    
    let person = Person::new("Alice", 30);
    person.greet();
    
    let numbers = vec![64, 34, 25, 12, 22, 11, 90];
    let mut sorted = numbers.clone();
    sorted.sort();
    println!("Original: {:?}", numbers);
    println!("Sorted: {:?}", sorted);
}
```

```typescript
// TypeScript example
interface Person {
    name: string;
    age: number;
    email?: string;
}

class Calculator {
    private result: number = 0;
    
    add(value: number): Calculator {
        this.result += value;
        return this;
    }
    
    multiply(value: number): Calculator {
        this.result *= value;
        return this;
    }
    
    getResult(): number {
        return this.result;
    }
}

function fibonacci(n: number): number {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

const greetPerson = (person: Person): string => {
    return `Hello, ${person.name}! You are ${person.age} years old.`;
};

// Usage
const person: Person = { name: "Alice", age: 30 };
console.log(greetPerson(person));
console.log(`Fibonacci(10) = ${fibonacci(10)}`);

const calc = new Calculator();
const result = calc.add(10).multiply(2).add(5).getResult();
console.log(`Calculator result: ${result}`);
```

```ruby
# Ruby example
class Person
  attr_accessor :name, :age
  
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def greet
    puts "Hello, I'm #{@name} and I'm #{@age} years old"
  end
  
  def adult?
    @age >= 18
  end
end

def fibonacci(n)
  return n if n <= 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

def quicksort(array)
  return array if array.length <= 1
  
  pivot = array[array.length / 2]
  left = array.select { |x| x < pivot }
  middle = array.select { |x| x == pivot }
  right = array.select { |x| x > pivot }
  
  quicksort(left) + middle + quicksort(right)
end

# Usage
puts "Hello, World!"
puts "Fibonacci(10) = #{fibonacci(10)}"

person = Person.new("Alice", 30)
person.greet
puts "Is adult? #{person.adult?}"

numbers = [64, 34, 25, 12, 22, 11, 90]
puts "Original: #{numbers}"
puts "Sorted: #{quicksort(numbers)}"
```

```php
<?php
// PHP example
class Person {
    private $name;
    private $age;
    
    public function __construct($name, $age) {
        $this->name = $name;
        $this->age = $age;
    }
    
    public function greet() {
        return "Hello, I'm {$this->name} and I'm {$this->age} years old";
    }
    
    public function isAdult() {
        return $this->age >= 18;
    }
}

function fibonacci($n) {
    if ($n <= 1) return $n;
    return fibonacci($n - 1) + fibonacci($n - 2);
}

function quicksort($array) {
    if (count($array) <= 1) return $array;
    
    $pivot = $array[intval(count($array) / 2)];
    $left = array_filter($array, function($x) use ($pivot) { return $x < $pivot; });
    $middle = array_filter($array, function($x) use ($pivot) { return $x == $pivot; });
    $right = array_filter($array, function($x) use ($pivot) { return $x > $pivot; });
    
    return array_merge(quicksort($left), $middle, quicksort($right));
}

// Usage
echo "Hello, World!\n";
echo "Fibonacci(10) = " . fibonacci(10) . "\n";

$person = new Person("Alice", 30);
echo $person->greet() . "\n";
echo "Is adult? " . ($person->isAdult() ? "Yes" : "No") . "\n";

$numbers = [64, 34, 25, 12, 22, 11, 90];
echo "Original: " . implode(", ", $numbers) . "\n";
echo "Sorted: " . implode(", ", quicksort($numbers)) . "\n";
?>
```

```swift
// Swift example
import Foundation

struct Person {
    let name: String
    let age: Int
    
    func greet() -> String {
        return "Hello, I'm \(name) and I'm \(age) years old"
    }
    
    var isAdult: Bool {
        return age >= 18
    }
}

func fibonacci(_ n: Int) -> Int {
    if n <= 1 { return n }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

func quicksort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count / 2]
    let left = array.filter { $0 < pivot }
    let middle = array.filter { $0 == pivot }
    let right = array.filter { $0 > pivot }
    
    return quicksort(left) + middle + quicksort(right)
}

// Usage
print("Hello, World!")
print("Fibonacci(10) = \(fibonacci(10))")

let person = Person(name: "Alice", age: 30)
print(person.greet())
print("Is adult? \(person.isAdult)")

let numbers = [64, 34, 25, 12, 22, 11, 90]
print("Original: \(numbers)")
print("Sorted: \(quicksort(numbers))")
```

```kotlin
// Kotlin example
data class Person(val name: String, val age: Int) {
    fun greet(): String = "Hello, I'm $name and I'm $age years old"
    val isAdult: Boolean get() = age >= 18
}

fun fibonacci(n: Int): Int {
    return when {
        n <= 1 -> n
        else -> fibonacci(n - 1) + fibonacci(n - 2)
    }
}

fun <T : Comparable<T>> quicksort(list: List<T>): List<T> {
    if (list.size <= 1) return list
    
    val pivot = list[list.size / 2]
    val left = list.filter { it < pivot }
    val middle = list.filter { it == pivot }
    val right = list.filter { it > pivot }
    
    return quicksort(left) + middle + quicksort(right)
}

fun main() {
    println("Hello, World!")
    println("Fibonacci(10) = ${fibonacci(10)}")
    
    val person = Person("Alice", 30)
    println(person.greet())
    println("Is adult? ${person.isAdult}")
    
    val numbers = listOf(64, 34, 25, 12, 22, 11, 90)
    println("Original: $numbers")
    println("Sorted: ${quicksort(numbers)}")
}
```

### Indented Code Block

    This is an indented code block
    It preserves whitespace
    And shows code formatting

## Blockquotes

> This is a blockquote.
> It can span multiple lines.

> This is a blockquote with **bold text** and *italic text*.

> ## Blockquote with heading
> 
> This blockquote contains a heading and multiple paragraphs.
> 
> - It can also contain lists
> - And other markdown elements

### Nested Blockquotes

> This is a blockquote.
> 
> > This is a nested blockquote.
> > It's indented further.
> 
> Back to the first level.

## Tables

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
| **Bold** | *Italic* | `Code`   |

### Table with Alignment

| Left Aligned | Center Aligned | Right Aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
| Text         | Text           | Text          |
| More content | More content   | More content  |

## Horizontal Rules

---

***

___

## Task Lists

- [x] Completed task
- [ ] Incomplete task
- [x] Another completed task
  - [x] Nested completed task
  - [ ] Nested incomplete task

## Special Characters and Escaping

\*This text is not italic\*

\`This is not code\`

\# This is not a heading

## HTML Elements

<kbd>Ctrl</kbd> + <kbd>C</kbd>

<mark>Highlighted text</mark>

<sub>Subscript</sub> and <sup>Superscript</sup>

<details>
<summary>Click to expand</summary>

This content is hidden by default and can be expanded.

It can contain **markdown** too!

</details>

## Math (MathJax Support)

**To enable MathJax on a page, add `mathjax: true` to the front matter:**

```yaml
---
layout: page
title: Your Page Title
mathjax: true
---
```

Once enabled, you can use LaTeX syntax for mathematical expressions:

**Inline math:** Use single dollar signs: `$E = mc^2$` renders as $E = mc^2$

**Block math:** Use double dollar signs for display equations:

```latex
$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$
```

Renders as:

$\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}$

**Matrix example:**

```latex
$
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}
$
```

Renders as:

$
\begin{pmatrix} a & b \\ c & d \end{pmatrix}
$

**More complex equations:**

```latex
$
f(x) = \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!}(x-a)^n
$
```

$
f(x) = \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!}(x-a)^n
$

## Footnotes

Here's a sentence with a footnote[^1].

Here's another footnote[^note].

[^1]: This is the first footnote.
[^note]: This is a named footnote.

## Definition Lists

Term 1
: Definition 1

Term 2
: Definition 2a
: Definition 2b

## Abbreviations

*[HTML]: Hyper Text Markup Language
*[CSS]: Cascading Style Sheets

HTML and CSS are web technologies.

## Line Breaks and Spacing

This is the first paragraph.

This is the second paragraph with some space above.


This paragraph has extra space above it.

## Emphasis Combinations

**Bold text with *italic inside* it**

*Italic text with **bold inside** it*

***All bold and italic***

## Special Lists

### Checklist with Various States
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] List syntax required (any unordered or ordered list supported)
- [x] This is a complete item
- [ ] This is an incomplete item

### Definition List Style
Apple
: A red fruit

Orange
: An orange fruit

## Edge Cases

### Empty Elements
- 
- Item with content
- 

### URLs and Emails
Contact: email@example.com
Website: https://example.com

### Long Lines
This is a very long line that should wrap properly in the browser and demonstrate how the markdown renderer handles text that exceeds the normal line length and needs to be wrapped to fit within the content area.

## Conclusion

This markdown test file contains most standard markdown elements to verify proper rendering and styling.